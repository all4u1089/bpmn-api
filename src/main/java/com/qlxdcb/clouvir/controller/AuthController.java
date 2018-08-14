package com.qlxdcb.clouvir.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.pac4j.core.profile.CommonProfile;
import org.pac4j.jwt.config.encryption.SecretEncryptionConfiguration;
import org.pac4j.jwt.config.signature.SecretSignatureConfiguration;
import org.pac4j.jwt.config.signature.SignatureConfiguration;
import org.pac4j.jwt.credentials.authenticator.JwtAuthenticator;
import org.pac4j.jwt.profile.JwtGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.qlxdcb.clouvir.enums.ApiErrorEnum;
import com.qlxdcb.clouvir.enums.InvalidTokenStatusEnum;
import com.qlxdcb.clouvir.model.InvalidToken;
import com.qlxdcb.clouvir.model.QUser;
import com.qlxdcb.clouvir.model.ResetToken;
import com.qlxdcb.clouvir.model.User;
import com.qlxdcb.clouvir.model.medial.Medial_Param;
import com.qlxdcb.clouvir.repository.InvalidTokenRepository;
import com.qlxdcb.clouvir.service.InvalidTokenService;
import com.qlxdcb.clouvir.service.ResetTokenService;
import com.qlxdcb.clouvir.service.UserService;
import com.qlxdcb.clouvir.util.ProfileUtils;
import com.qlxdcb.clouvir.util.Utils;

import io.swagger.annotations.Api;

@RestController
@Api(value = "auth", description = "")
public class AuthController {

	@Value("${salt}")
	private String salt;

	private static final String anonymous = "unbreakable";

	@Autowired
	ProfileUtils profileUtil;

	@Autowired
	UserService userService;

	@Autowired
	InvalidTokenRepository invalidTokenRep;

	@Autowired
	InvalidTokenService invalidTokenService;
	
	@Autowired
	ResetTokenService resetTokenService;

	@RequestMapping(method = RequestMethod.POST, value = "/auth/login")
	public @ResponseBody ResponseEntity<Object> login(@RequestHeader(value = "Email", required = true) String username,
			@RequestHeader(value = "Password", required = true) String password) {

		try {
			Map<String, Object> result = new HashMap<>();
			User user;
			
			if (username != null && !username.isEmpty()) {
				user = userService.findOne(QUser.user.deleted.eq(false).and(QUser.user.active.isTrue()).and(QUser.user.email.eq(username)));
				if (user != null && !user.isDeleted() && user.isActive()) {
					if (user.checkPassword(password)) {
						user.setRecentSignIn(Utils.localDateTimeNow());
						userService.save(user, user.getId());
						//Rename location for first time
						return returnUser(result, user);
					} else {
						return Utils.responseErrors(HttpStatus.NOT_FOUND,
								ApiErrorEnum.LOGIN_USER_PASSWORD_INCORRECT.name(),
								ApiErrorEnum.LOGIN_USER_PASSWORD_INCORRECT.getText(),
								ApiErrorEnum.LOGIN_USER_PASSWORD_INCORRECT.getText());
					}
				} else {
					userService.bootstrapUsers();
					return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.USER_NOT_EXISTS.name(),
							ApiErrorEnum.USER_NOT_EXISTS.getText(), ApiErrorEnum.USER_NOT_EXISTS.getText());
				}
			}

			return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
					ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}


	@RequestMapping(method = RequestMethod.POST, value = "/auth/confirmCode")
	public @ResponseBody ResponseEntity<Object> confirmCode(@RequestBody Medial_Param params) {
		try {
			String[] part = params.getCode() != null ? params.getCode().split(getAnonymousCode()) : new String[0];
			boolean acceptRequest = false;
			if (part != null && part.length == 2) {
				ResetToken token = resetTokenService.predFindToKenCurrentByToken(params.getCode());

				if (token != null) {
					return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				}

				String checkEmail = new String(Base64.decodeBase64(part[0]));
				String checkTime = part[1];
				User user = userService.findOne(QUser.user.deleted.eq(false).and(QUser.user.email.eq(checkEmail)));
				if (user != null) {
					String salKey = user.getSalkey();
					String salKeyHash = DigestUtils.md5Hex(salKey);
					String timeBase = new String(Base64.decodeBase64(checkTime.getBytes()));
					String time = timeBase.replaceAll(salKeyHash, "");
					try {
						long t = Long.valueOf(time);
						if (t > 0) {
							long diff = new Date().getTime() - t;
							long threeHours = TimeUnit.HOURS.toMillis(3);
							acceptRequest = diff < threeHours;
						}
					} catch (NumberFormatException e) {
						// TODO: handle exception
					}
				}
			}
			if (acceptRequest) {
				return new ResponseEntity<>(HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(method = RequestMethod.POST, value = "/auth/changePassword")
	public @ResponseBody ResponseEntity<Object> changePassword(
			@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestBody Medial_Param params) {
		try {
			Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
			User user = userService.findOne(userId);
			if (user.checkPassword(params.getOldPassword())) {
				if (!params.getNewPassword().equals(params.getNewPasswordAgain())) {
					return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.NEW_PASSWORD_NOT_SAME.name(),
							ApiErrorEnum.NEW_PASSWORD_NOT_SAME.getText(), ApiErrorEnum.NEW_PASSWORD_NOT_SAME.getText());
				} else {
					user.updatePassword(params.getNewPasswordAgain());
					userService.save(user, userId);
					return new ResponseEntity<>(HttpStatus.OK);
				}
			} else {
				return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.OLD_PASSWORD_INCORRECT.name(),
						ApiErrorEnum.OLD_PASSWORD_INCORRECT.getText(), ApiErrorEnum.OLD_PASSWORD_INCORRECT.getText());
			}
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/auth/resetPassword")
	public @ResponseBody ResponseEntity<Object> resetPassword(@RequestBody Medial_Param params) {
		try {
			String[] part = params.getCode() != null ? params.getCode().split(getAnonymousCode()) : new String[0];
			boolean acceptRequest = false;
			if (part != null && part.length == 2) {
				ResetToken token = resetTokenService.predFindToKenCurrentByToken(params.getCode());

				if (token != null) {
					return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				}

				String checkEmail = new String(Base64.decodeBase64(part[0]));
				String checkTime = part[1];
				User user = userService.findOne(QUser.user.deleted.eq(false).and(QUser.user.email.eq(checkEmail)));
				if (user != null) {
					String salKey = user.getSalkey();
					String salKeyHash = DigestUtils.md5Hex(salKey);
					String timeBase = new String(Base64.decodeBase64(checkTime.getBytes()));
					String time = timeBase.replaceAll(salKeyHash, "");
					try {
						long t = Long.valueOf(time);
						if (t > 0) {
							long diff = new Date().getTime() - t;
							long threeHours = TimeUnit.HOURS.toMillis(3);
							acceptRequest = diff < threeHours;
						}
					} catch (NumberFormatException e) {
						// TODO: handle exception
					}
				}

				if (!params.getPassword().equals(params.getPasswordAgain())) {
					return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.NEW_PASSWORD_NOT_SAME.name(),
							ApiErrorEnum.NEW_PASSWORD_NOT_SAME.getText(), ApiErrorEnum.NEW_PASSWORD_NOT_SAME.getText());
				}

				if (acceptRequest) {
					user.updatePassword(params.getPassword());
					ResetToken tokenReset = new ResetToken(params.getCode());
					resetTokenService.save(tokenReset, user.getId());
					userService.save(user, user.getId());
					return new ResponseEntity<>(HttpStatus.OK);
				}
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	private String getAnonymousCode() {
		return new String(Base64.encodeBase64(DigestUtils.md5Hex(anonymous).getBytes()));
	}

	@RequestMapping(method = RequestMethod.POST, value = "/auth/logout")
	public ResponseEntity<Object> logout(@RequestHeader(value = "Authorization", required = true) final String authorization) {
		try {
			if (authorization != null && authorization.startsWith("Bearer")) {
				String currentToken = StringUtils.substringAfter(authorization, " ");
				final SignatureConfiguration secretSignatureConfiguration = new SecretSignatureConfiguration(salt);
				final SecretEncryptionConfiguration secretEncryptionConfiguration = new SecretEncryptionConfiguration(salt);
				final JwtAuthenticator authenticator = new JwtAuthenticator(secretSignatureConfiguration, secretEncryptionConfiguration);
				if (authenticator.validateToken(currentToken) != null) {
					InvalidToken token = invalidTokenService.predFindToKenCurrentByToken(currentToken);
					if (token != null) {
						token.setActive(false);
						token.setTokenStatus(InvalidTokenStatusEnum.LOGOUT);
						invalidTokenRep.save(token);
						return new ResponseEntity<>(HttpStatus.OK);
					} 
				}
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(method = RequestMethod.GET, value = "/auth/me")
	public @ResponseBody ResponseEntity<Object> getCurrentUser(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		try {
			Map<String, Object> result = new HashMap<>();
			User user = profileUtil.getUserInfo(authorization);
			if (user != null && user.isActive()) {
				return returnUser(result, user);
			}
			return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
					ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	private ResponseEntity<Object> returnUser(Map<String, Object> result, User user) {
		try {
			final SignatureConfiguration secretSignatureConfiguration = new SecretSignatureConfiguration(salt);
			final SecretEncryptionConfiguration secretEncryptionConfiguration = new SecretEncryptionConfiguration(salt);
			final JwtGenerator<CommonProfile> generator = new JwtGenerator<>();

			generator.setSignatureConfiguration(secretSignatureConfiguration);
			generator.setEncryptionConfiguration(secretEncryptionConfiguration);

			CommonProfile commonProfile = new CommonProfile();
			commonProfile.addAttribute("email", user.getEmail());

			if (user != null) {
				commonProfile.setId(user.getId());
				commonProfile.addAttribute("userId", user.getId());
				commonProfile.addAttribute("companyId", user.getCompany_id());
				commonProfile.addAttribute("fullName", user.getFullName());
				commonProfile.addAttribute("roleType", user.getRole() != null ? user.getRole().getRoleType().toString() : "");	
				result.put("fullName", user.getFullName());
				String token = generator.generate(commonProfile);
				result.put("token", token);
				result.put("email", user.getEmail());
				result.put("userId", user.getId());
				result.put("companyId", user.getCompany_id());
				result.put("role", user.getRole());
				
				InvalidToken invalidToken = invalidTokenService.predFindToKenCurrentByUser(user.getId());
				if (invalidToken == null) {
					invalidToken = new InvalidToken();
				}

				invalidToken.setToken(token);
				invalidToken.setActive(true);
				invalidToken.setUser(user);
				invalidToken.setTokenStatus(InvalidTokenStatusEnum.LOGIN);
				invalidTokenService.save(invalidToken, user.getId());
			}

			return new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
}
