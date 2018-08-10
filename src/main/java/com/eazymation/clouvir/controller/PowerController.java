package com.eazymation.clouvir.controller;

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

import com.eazymation.clouvir.enums.PowerEnum;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@Api(value = "powers", description = "Powers")
public class PowerController {

	@RequestMapping(method = RequestMethod.GET, value = "/powers")
	@ApiOperation(value = "Get list of Powers", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getList(@RequestHeader(value = "Authorization", required = true) String authorization) {
		
		List<Map<String, Object>> powerList = new ArrayList<>();
		Map<String, Object> powerObj = new HashMap<>();
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Role");
		powerObj.put("powerName", PowerEnum.ROLE_LIST.getText() + "," + PowerEnum.ROLE_VIEW.getText() + "," + PowerEnum.ROLE_ADD.getText() + "," + PowerEnum.ROLE_UPDATE.getText() + "," + PowerEnum.ROLE_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.ROLE_LIST.name() + "," + PowerEnum.ROLE_VIEW.name() + "," + PowerEnum.ROLE_ADD.name() + "," + PowerEnum.ROLE_UPDATE.name() + "," + PowerEnum.ROLE_DELETE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Employee");
		powerObj.put("powerName", PowerEnum.EMPLOYEE_LIST.getText() + "," + PowerEnum.EMPLOYEE_VIEW.getText() + "," + PowerEnum.EMPLOYEE_ADD.getText() + "," + PowerEnum.EMPLOYEE_UPDATE.getText() + "," + PowerEnum.EMPLOYEE_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.EMPLOYEE_LIST.name() + "," + PowerEnum.EMPLOYEE_VIEW.name() + "," + PowerEnum.EMPLOYEE_ADD.name() + "," + PowerEnum.EMPLOYEE_UPDATE.name() + "," + PowerEnum.EMPLOYEE_DELETE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Employer");
		powerObj.put("powerName", PowerEnum.EMPLOYER_LIST.getText() + "," + PowerEnum.EMPLOYER_VIEW.getText() + "," + PowerEnum.EMPLOYER_ADD.getText() + "," + PowerEnum.EMPLOYER_UPDATE.getText() + "," + PowerEnum.EMPLOYER_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.EMPLOYER_LIST.name() + "," + PowerEnum.EMPLOYER_VIEW.name() + "," + PowerEnum.EMPLOYER_ADD.name() + "," + PowerEnum.EMPLOYER_UPDATE.name() + "," + PowerEnum.EMPLOYER_DELETE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Company");
		powerObj.put("powerName", PowerEnum.COMPANY_LIST.getText() + "," + PowerEnum.COMPANY_VIEW.getText() + "," + PowerEnum.COMPANY_ADD.getText() + "," + PowerEnum.COMPANY_UPDATE.getText() + "," + PowerEnum.COMPANY_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.COMPANY_LIST.name() + "," + PowerEnum.COMPANY_VIEW.name() + "," + PowerEnum.COMPANY_ADD.name() + "," + PowerEnum.COMPANY_UPDATE.name() + "," + PowerEnum.COMPANY_DELETE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Project");
		powerObj.put("powerName", PowerEnum.PROJECT_LIST.getText() + "," + PowerEnum.PROJECT_VIEW.getText() + "," + PowerEnum.PROJECT_ADD.getText() + "," + PowerEnum.PROJECT_UPDATE.getText() + "," + PowerEnum.PROJECT_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.PROJECT_LIST.name() + "," + PowerEnum.PROJECT_VIEW.name() + "," + PowerEnum.PROJECT_ADD.name() + "," + PowerEnum.PROJECT_UPDATE.name() + "," + PowerEnum.PROJECT_DELETE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Help");
		powerObj.put("powerName", PowerEnum.HELP_LIST.getText() + "," + PowerEnum.HELP_VIEW.getText() + "," + PowerEnum.HELP_ADD.getText() + "," + PowerEnum.HELP_UPDATE.getText() + "," + PowerEnum.HELP_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.HELP_LIST.name() + "," + PowerEnum.HELP_VIEW.name() + "," + PowerEnum.HELP_ADD.name() + "," + PowerEnum.HELP_UPDATE.name() + "," + PowerEnum.HELP_DELETE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Product");
		powerObj.put("powerName", PowerEnum.PRODUCT_LIST.getText() + "," + PowerEnum.PRODUCT_VIEW.getText() + "," + PowerEnum.PRODUCT_ADD.getText() + "," + PowerEnum.PRODUCT_UPDATE.getText()
			+ "," + PowerEnum.PRODUCT_DELETE.getText() + "," + PowerEnum.PRODUCT_REGISTER.getText() + "," + PowerEnum.PRODUCT_CONFIRM.getText());
		powerObj.put("powerValue", PowerEnum.PRODUCT_LIST.name() + "," + PowerEnum.PRODUCT_VIEW.name() + "," + PowerEnum.PRODUCT_ADD.name() + "," + PowerEnum.PRODUCT_UPDATE.name()
			+ "," + PowerEnum.PRODUCT_DELETE.name() + "," + PowerEnum.PRODUCT_REGISTER.name() + "," + PowerEnum.PRODUCT_CONFIRM.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Equipment Kind");
		powerObj.put("powerName", PowerEnum.EQUIPMENTKIND_LIST.getText() + "," + PowerEnum.EQUIPMENTKIND_VIEW.getText() + "," + PowerEnum.EQUIPMENTKIND_ADD.getText() + "," + PowerEnum.EQUIPMENTKIND_UPDATE.getText() + "," + PowerEnum.EQUIPMENTKIND_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.EQUIPMENTKIND_LIST.name() + "," + PowerEnum.EQUIPMENTKIND_VIEW.name() + "," + PowerEnum.EQUIPMENTKIND_ADD.name() + "," + PowerEnum.EQUIPMENTKIND_UPDATE.name() + "," + PowerEnum.EQUIPMENTKIND_DELETE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Setting");
		powerObj.put("powerName", PowerEnum.SETTING_VIEW.getText() + "," + PowerEnum.SETTING_UPDATE.getText());
		powerObj.put("powerValue", PowerEnum.SETTING_VIEW.name() + "," + PowerEnum.SETTING_UPDATE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Equipment");
		powerObj.put("powerName", PowerEnum.EQUIPMENT_LIST.getText() + "," + PowerEnum.EQUIPMENT_VIEW.getText() + "," + PowerEnum.EQUIPMENT_ADD.getText() + "," + PowerEnum.EQUIPMENT_UPDATE.getText() 
			+ "," + PowerEnum.EQUIPMENT_DELETE.getText() + "," + PowerEnum.EQUIPMENT_CONFIRMUSAGE.getText() + "," + PowerEnum.EQUIPMENT_REQUESTTERMINATION.getText() + "," + PowerEnum.EQUIPMENT_CONFIRMTERMINATION.getText());
		powerObj.put("powerValue", PowerEnum.EQUIPMENT_LIST.name() + "," + PowerEnum.EQUIPMENT_VIEW.name() + "," + PowerEnum.EQUIPMENT_ADD.name() + "," + PowerEnum.EQUIPMENT_UPDATE.name() 
			+ "," + PowerEnum.EQUIPMENT_DELETE.name() + "," + PowerEnum.EQUIPMENT_CONFIRMUSAGE.name() + "," + PowerEnum.EQUIPMENT_REQUESTTERMINATION.name() + "," + PowerEnum.EQUIPMENT_CONFIRMTERMINATION.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Security Violation");
		powerObj.put("powerName", PowerEnum.SECURITYVIOLATION_LIST.getText() + "," + PowerEnum.SECURITYVIOLATION_VIEW.getText() + "," + PowerEnum.SECURITYVIOLATION_ADD.getText() + "," + PowerEnum.SECURITYVIOLATION_UPDATE.getText()
			+ "," + PowerEnum.SECURITYVIOLATION_DELETE.getText() + "," + PowerEnum.SECURITYVIOLATION_DOACTION.getText());
		powerObj.put("powerValue", PowerEnum.SECURITYVIOLATION_LIST.name() + "," + PowerEnum.SECURITYVIOLATION_VIEW.name() + "," + PowerEnum.SECURITYVIOLATION_ADD.name() + "," + PowerEnum.SECURITYVIOLATION_UPDATE.name()
			+ "," + PowerEnum.SECURITYVIOLATION_DELETE.name() + "," + PowerEnum.SECURITYVIOLATION_DOACTION.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Security Education");
		powerObj.put("powerName", PowerEnum.SECURITYEDUCATION_LIST.getText() + "," + PowerEnum.SECURITYEDUCATION_VIEW.getText() + "," + PowerEnum.SECURITYEDUCATION_ADD.getText() + "," + PowerEnum.SECURITYEDUCATION_UPDATE.getText()
		+ "," + PowerEnum.SECURITYEDUCATION_DELETE.getText() + "," + PowerEnum.SECURITYEDUCATION_REGISTERCOMPLETION.getText() + "," + PowerEnum.SECURITYEDUCATION_CONFIRMREQUEST.getText() + "," + PowerEnum.SECURITYEDUCATION_CONFIRMCOMPLETION.getText());
		powerObj.put("powerValue", PowerEnum.SECURITYEDUCATION_LIST.name() + "," + PowerEnum.SECURITYEDUCATION_VIEW.name() + "," + PowerEnum.SECURITYEDUCATION_ADD.name() + "," + PowerEnum.SECURITYEDUCATION_UPDATE.name()
		+ "," + PowerEnum.SECURITYEDUCATION_DELETE.name() + "," + PowerEnum.SECURITYEDUCATION_REGISTERCOMPLETION.name() + "," + PowerEnum.SECURITYEDUCATION_CONFIRMREQUEST.name() + "," + PowerEnum.SECURITYEDUCATION_CONFIRMCOMPLETION.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Security Check");
		powerObj.put("powerName", PowerEnum.SECURITYCHECK_LIST.getText() + "," + PowerEnum.SECURITYCHECK_VIEW.getText() + "," + PowerEnum.SECURITYCHECK_ADD.getText() + "," + PowerEnum.SECURITYCHECK_UPDATE.getText() + "," + PowerEnum.SECURITYCHECK_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.SECURITYCHECK_LIST.name() + "," + PowerEnum.SECURITYCHECK_VIEW.name() + "," + PowerEnum.SECURITYCHECK_ADD.name() + "," + PowerEnum.SECURITYCHECK_UPDATE.name() + "," + PowerEnum.SECURITYCHECK_DELETE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Sender Message");
		powerObj.put("powerName", PowerEnum.MESSAGE_LIST.getText() + "," + PowerEnum.MESSAGE_VIEW.getText() + "," + PowerEnum.MESSAGE_ADD.getText() + "," + PowerEnum.MESSAGE_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.MESSAGE_LIST.name() + "," + PowerEnum.MESSAGE_VIEW.name() + "," + PowerEnum.MESSAGE_ADD.name() + "," + PowerEnum.MESSAGE_DELETE.name());
		powerList.add(powerObj);
		
		powerObj = new HashMap<>();
		powerObj.put("functionName","Receive Message");
		powerObj.put("powerName", PowerEnum.MESSAGERECEIVER_LIST.getText() + "," + PowerEnum.MESSAGERECEIVER_VIEW.getText() + "," + PowerEnum.MESSAGERECEIVER_DELETE.getText());
		powerObj.put("powerValue", PowerEnum.MESSAGERECEIVER_LIST.name() + "," + PowerEnum.MESSAGERECEIVER_VIEW.name() + "," + PowerEnum.MESSAGERECEIVER_DELETE.name());
		powerList.add(powerObj);
		
		Map<String, List<Map<String, Object>>> errorBody = new HashMap<>();
		errorBody.put("powerList", powerList);

		return new ResponseEntity<>(powerList, HttpStatus.OK);
	}
	
}
