package com.qlxdcb.clouvir.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.qlxdcb.clouvir.enums.ApiErrorEnum;
import com.qlxdcb.clouvir.enums.PowerEnum;
import com.qlxdcb.clouvir.model.Setting;
import com.qlxdcb.clouvir.service.SettingService;
import com.qlxdcb.clouvir.util.Utils;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import vn.greenglobal.core.model.common.BaseRepository;

@RestController
@RepositoryRestController
@Api(value = "settings", description = "Setting")
public class SettingController extends ClouvirController<Setting> {

	@Autowired
	private SettingService settingService;

	public SettingController(BaseRepository<Setting, Long> repo) {
		super(repo);
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@RequestMapping(method = RequestMethod.GET, value = "/settings")
	@ApiOperation(value = "Get setting", position = 3, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Get the equipment kind successful", response = Setting.class) })
	public ResponseEntity<Object> getById(@RequestHeader(value = "Authorization", required = true) String authorization, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			if (map != null) {
				if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.SETTING_VIEW) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			Setting setting = settingService.findOne(1L);
			if (setting == null) {
				setting = new Setting("clouvirdata");
				settingService.save(setting, Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString()));
			}
			return new ResponseEntity<>(eass.toFullResource(setting), HttpStatus.OK);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(method = RequestMethod.PUT, value = "/settings")
	@ApiOperation(value = "Update setting", position = 4, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Update the equipment kind successful", response = Setting.class) })
	public @ResponseBody ResponseEntity<Object> update(
			@RequestHeader(value = "Authorization", required = true) String authorization, 
			@RequestBody Setting setting, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			if (map != null) {
				if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.SETTING_UPDATE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			setting.setId(1L);

			return settingService.doSave(setting,
					Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString()), eass,
					HttpStatus.OK);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
}
