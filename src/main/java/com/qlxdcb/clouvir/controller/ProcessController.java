package com.qlxdcb.clouvir.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.camunda.bpm.engine.impl.pvm.PvmTransition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.qlxdcb.clouvir.service.ProcessService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@Api(value = "processes", description = "List of process")
public class ProcessController {
	
	@Autowired
	ProcessService processService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/beginTransitions")
	@ApiOperation(value = "Get list of transition for begin", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getTransitions(
			@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestParam(value = "taskDefinitionKey", required = true) String taskDefinitionKey,
			@RequestParam(value = "processDefinitionKey", required = true) String processDefinitionKey) {
		//taskDefinitionKey: lapNhuCauVon
		//processDefinitionKey: taoKeHoachNhuCauVon
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = null;

		List<PvmTransition> listTrans = processService.getTransitions(taskDefinitionKey, processDefinitionKey);
		
		for (PvmTransition tran : listTrans) {
			object = new HashMap<>();
			object.put("name", tran.getProperty("name"));
			object.put("value", tran.getId());
			list.add(object);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/updateTransitions")
	@ApiOperation(value = "Get list of transition for update", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getTransitions2(
			@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestParam(value = "taskDefinitionKey", required = true) String taskDefinitionKey,
			@RequestParam(value = "processDefinitionId", required = true) String processDefinitionId) {
		//taskDefinitionKey: lapNhuCauVon
		//processDefinitionKey: taoKeHoachNhuCauVon
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = null;

		List<PvmTransition> listTrans = processService.getTransitions2(taskDefinitionKey, processDefinitionId);
		
		for (PvmTransition tran : listTrans) {
			object = new HashMap<>();
			object.put("name", tran.getProperty("name"));
			object.put("value", tran.getId());
			list.add(object);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
}
