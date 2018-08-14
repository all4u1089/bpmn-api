package com.qlxdcb.clouvir.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.qlxdcb.clouvir.enums.RoleTypeEnum;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@Api(value = "enumListTypes", description = "List of Enum Comboboxs")
public class EnumController {
	
	@RequestMapping(method = RequestMethod.GET, value = "/roleTypes")
	@ApiOperation(value = "Get list of role type", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getRoleTypes(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

//		object.put("name", RoleTypeEnum.SUPER_ADMIN.getText());
//		object.put("value", RoleTypeEnum.SUPER_ADMIN.name());
//		list.add(object);
//
//		object = new HashMap<>();
		object.put("name", RoleTypeEnum.SECURITY_MANAGER.getText());
		object.put("value", RoleTypeEnum.SECURITY_MANAGER.name());
		list.add(object);

		object = new HashMap<>();
		object.put("name", RoleTypeEnum.PROJECT_ADMIN.getText());
		object.put("value", RoleTypeEnum.PROJECT_ADMIN.name());
		list.add(object);

		object = new HashMap<>();
		object.put("name", RoleTypeEnum.PROJECT_MANAGER.getText());
		object.put("value", RoleTypeEnum.PROJECT_MANAGER.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", RoleTypeEnum.WORKER.getText());
		object.put("value", RoleTypeEnum.WORKER.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
}
