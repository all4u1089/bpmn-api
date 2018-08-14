package com.qlxdcb.clouvir.util;

import org.apache.commons.lang3.StringUtils;
import org.pac4j.core.profile.CommonProfile;
import org.pac4j.jwt.config.encryption.SecretEncryptionConfiguration;
import org.pac4j.jwt.config.signature.SecretSignatureConfiguration;
import org.pac4j.jwt.config.signature.SignatureConfiguration;
import org.pac4j.jwt.credentials.authenticator.JwtAuthenticator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.qlxdcb.clouvir.model.InvalidToken;
import com.qlxdcb.clouvir.model.QInvalidToken;
import com.qlxdcb.clouvir.model.QUser;
import com.qlxdcb.clouvir.model.User;
import com.qlxdcb.clouvir.repository.InvalidTokenRepository;
import com.qlxdcb.clouvir.repository.UserRepository;

@Component
public class ProfileUtils {

	@Value("${salt}")
	private String salt;

	@Autowired
	UserRepository userRepository;

	@Autowired
	InvalidTokenRepository invalidTokenRep;
	
	private User user;
	private CommonProfile profile;
	private SignatureConfiguration secretSignatureConfiguration;
	private SecretEncryptionConfiguration secretEncryptionConfiguration;
	private JwtAuthenticator authenticator;

	public CommonProfile getProfile() {
		return profile;
	}
	
	public User getUserInfo() {
		if (profile != null) {
			user = userRepository.findOne(QUser.user.deleted.eq(false)
					.and(QUser.user.active.isTrue())
					.and(QUser.user.email.eq(String.valueOf(profile.getAttribute("email")))));
			return user;
		}
		return null;
	}
	
	public ProfileUtils get(String authHeader) {
		if (authHeader != null && authHeader.startsWith("Bearer")) {
			String token = StringUtils.substringAfter(authHeader, " ");
			secretSignatureConfiguration = new SecretSignatureConfiguration(salt);
			secretEncryptionConfiguration = new SecretEncryptionConfiguration(salt);
			authenticator = new JwtAuthenticator(secretSignatureConfiguration, secretEncryptionConfiguration);
			profile = authenticator.validateToken(token);
		}
		return this;
	}
	
	public boolean checkTokenActive(String token){
		InvalidToken invalid = invalidTokenRep.findOne(QInvalidToken.invalidToken.token.eq(token).and(QInvalidToken.invalidToken.active.isTrue()));
		if (invalid != null) {
			return true;
		}
		return false;
	}
	
	@Deprecated
	public User getUserInfo(String authHeader) {
		getCommonProfile(authHeader);
		if (profile != null) {
			user = userRepository.findOne(QUser.user.deleted.eq(false)
					.and(QUser.user.active.isTrue())
					.and(QUser.user.email.eq(String.valueOf(profile.getAttribute("email")))));
			return user;
		}
		return null;
	}

	@Deprecated
	public CommonProfile getCommonProfile(String authHeader) {
		if (authHeader != null && authHeader.startsWith("Bearer")) {
			String token = StringUtils.substringAfter(authHeader, " ");
//			InvalidToken invalid = invalidTokenRep.findOne(QInvalidToken.invalidToken.token.eq(token));
//			if (invalid != null) {
//				return null;
//			}
			secretSignatureConfiguration = new SecretSignatureConfiguration(salt);
			secretEncryptionConfiguration = new SecretEncryptionConfiguration(salt);
			authenticator = new JwtAuthenticator(secretSignatureConfiguration, secretEncryptionConfiguration);
			profile = authenticator.validateToken(token);
			if (profile != null) {
				return profile;
			}
		}
		return null;
	}

}
