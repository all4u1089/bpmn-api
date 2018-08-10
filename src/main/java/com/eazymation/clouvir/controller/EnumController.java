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

import com.eazymation.clouvir.enums.BusinessScopeEnum;
import com.eazymation.clouvir.enums.CompanySizeEnum;
import com.eazymation.clouvir.enums.ContractStatusEnum;
import com.eazymation.clouvir.enums.CycleEnum;
import com.eazymation.clouvir.enums.DateOfShipment;
import com.eazymation.clouvir.enums.DaysOfWeekEnum;

import com.eazymation.clouvir.enums.EquipmentProgressEnum;
import com.eazymation.clouvir.enums.InspectionTimeEnum;
import com.eazymation.clouvir.enums.InspectionTimeSessionEnum;
import com.eazymation.clouvir.enums.ProgressStepEnum;
import com.eazymation.clouvir.enums.RoleTypeEnum;
import com.eazymation.clouvir.enums.SearchDateCompanyEnum;
import com.eazymation.clouvir.enums.SearchDateEquipmentTypeEnum;
import com.eazymation.clouvir.enums.SearchDateProductEnum;
import com.eazymation.clouvir.enums.MessageStatusEnum;
import com.eazymation.clouvir.enums.PossessionEnum;
import com.eazymation.clouvir.enums.ProductProgressEnum;
import com.eazymation.clouvir.enums.SearchDateSecurityEducationEnum;
import com.eazymation.clouvir.enums.SearchDateSecurityViolationTypeEnum;
import com.eazymation.clouvir.enums.SearchDateSecurityCheckTypeEnum;

import com.eazymation.clouvir.enums.SearchDateTypeEnum;
import com.eazymation.clouvir.enums.SearchDateUserTypeEnum;
import com.eazymation.clouvir.enums.SecurityEducationDivisionEnum;
import com.eazymation.clouvir.enums.SecurityCheckProgressEnum;
import com.eazymation.clouvir.enums.SecurityEducationProgressEnum;
import com.eazymation.clouvir.enums.SecurityViolationLevelEnum;
import com.eazymation.clouvir.enums.SecurityViolationProgressEnum;
import com.eazymation.clouvir.enums.ShippingType;
import com.eazymation.clouvir.enums.TargetRoleEnum;
import com.eazymation.clouvir.enums.TerminationMethodEnum;

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
	
	@RequestMapping(method = RequestMethod.GET, value = "/contractStatuses")
	@ApiOperation(value = "Get list of contract status", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getContractStatuses(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", ContractStatusEnum.BEFORE_CONTRACT.getText());
		object.put("value", ContractStatusEnum.BEFORE_CONTRACT.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ContractStatusEnum.UNDER_CONTRACT.getText());
		object.put("value", ContractStatusEnum.UNDER_CONTRACT.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ContractStatusEnum.END.getText());
		object.put("value", ContractStatusEnum.END.name());
		list.add(object);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/businessProgresses")
	@ApiOperation(value = "Get list of business progress", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getBusinessProgresses(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", ProgressStepEnum.PLAN.getText());
		object.put("value", ProgressStepEnum.PLAN.name());
		object.put("order", 1);
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ProgressStepEnum.PLANNING.getText());
		object.put("value", ProgressStepEnum.PLANNING.name());
		object.put("order", 2);
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ProgressStepEnum.BUSINESS_APPLICATION.getText());
		object.put("value", ProgressStepEnum.BUSINESS_APPLICATION.name());
		object.put("order", 3);
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ProgressStepEnum.CONDUCT_BUSINESS.getText());
		object.put("value", ProgressStepEnum.CONDUCT_BUSINESS.name());
		object.put("order", 4);
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ProgressStepEnum.INSPECTION_OPERATION.getText());
		object.put("value", ProgressStepEnum.INSPECTION_OPERATION.name());
		object.put("order", 5);
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ProgressStepEnum.PERFORMANCE_EVALUATION.getText());
		object.put("value", ProgressStepEnum.PERFORMANCE_EVALUATION.name());
		object.put("order", 6);
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/securityCheckProgresses")
	@ApiOperation(value = "Get list of business progress", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSecurityCheckProgresses(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SecurityCheckProgressEnum.ACTIVATION.getText());
		object.put("value", SecurityCheckProgressEnum.ACTIVATION.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SecurityCheckProgressEnum.INACTIVE.getText());
		object.put("value", SecurityCheckProgressEnum.INACTIVE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/searchDateTypes")
	@ApiOperation(value = "Get list of search date type", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSearchDateTypes(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SearchDateTypeEnum.ALL.getText());
		object.put("value", SearchDateTypeEnum.ALL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateTypeEnum.START_DATE.getText());
		object.put("value", SearchDateTypeEnum.START_DATE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateTypeEnum.END_DATE.getText());
		object.put("value", SearchDateTypeEnum.END_DATE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/searchDateCompanyTypes")
	@ApiOperation(value = "Get list of search date company", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSearchDateCompany(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SearchDateCompanyEnum.ALL.getText());
		object.put("value", SearchDateCompanyEnum.ALL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateCompanyEnum.REGISTRATION_DATE.getText());
		object.put("value", SearchDateCompanyEnum.REGISTRATION_DATE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateCompanyEnum.CONTACT_END_DATE.getText());
		object.put("value", SearchDateCompanyEnum.CONTACT_END_DATE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/companySizes")
	@ApiOperation(value = "Get list of company size", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getCompanySize(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", CompanySizeEnum.LESS_THAN_5.getText());
		object.put("value", CompanySizeEnum.LESS_THAN_5.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CompanySizeEnum.FROM_6_TO_10.getText());
		object.put("value", CompanySizeEnum.FROM_6_TO_10.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CompanySizeEnum.FROM_11_TO_30.getText());
		object.put("value", CompanySizeEnum.FROM_11_TO_30.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CompanySizeEnum.FROM_31_TO_50.getText());
		object.put("value", CompanySizeEnum.FROM_31_TO_50.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CompanySizeEnum.FROM_51_TO_100.getText());
		object.put("value", CompanySizeEnum.FROM_51_TO_100.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CompanySizeEnum.FROM_101_TO_300.getText());
		object.put("value", CompanySizeEnum.FROM_101_TO_300.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CompanySizeEnum.MORE_THAN_300.getText());
		object.put("value", CompanySizeEnum.MORE_THAN_300.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/searchDateUserTypes")
	@ApiOperation(value = "Get list of search date user type", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSearchDateUserType(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SearchDateUserTypeEnum.ALL.getText());
		object.put("value", SearchDateUserTypeEnum.ALL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateUserTypeEnum.REGISTRATION_DATE.getText());
		object.put("value", SearchDateUserTypeEnum.REGISTRATION_DATE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateUserTypeEnum.RECENT_SIGNIN.getText());
		object.put("value", SearchDateUserTypeEnum.RECENT_SIGNIN.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/searchDateSecurityViolationTypes")
	@ApiOperation(value = "Get list of search date security violation type", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSearchDateSecurityViolationType(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SearchDateSecurityViolationTypeEnum.ALL.getText());
		object.put("value", SearchDateSecurityViolationTypeEnum.ALL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateSecurityViolationTypeEnum.CORRECTIVE_REQUEST.getText());
		object.put("value", SearchDateSecurityViolationTypeEnum.CORRECTIVE_REQUEST.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateSecurityViolationTypeEnum.MEASURE.getText());
		object.put("value", SearchDateSecurityViolationTypeEnum.MEASURE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateSecurityViolationTypeEnum.APPROVE.getText());
		object.put("value", SearchDateSecurityViolationTypeEnum.APPROVE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/searchDateEquipmentTypes")
	@ApiOperation(value = "Get list of search date equipment type", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSearchDateEquipmentType(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SearchDateEquipmentTypeEnum.ALL.getText());
		object.put("value", SearchDateEquipmentTypeEnum.ALL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateEquipmentTypeEnum.AUTHORIZATION_TO_USE.getText());
		object.put("value", SearchDateEquipmentTypeEnum.AUTHORIZATION_TO_USE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateEquipmentTypeEnum.END_APPROVAL.getText());
		object.put("value", SearchDateEquipmentTypeEnum.END_APPROVAL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateEquipmentTypeEnum.TERMINATION_REQUEST.getText());
		object.put("value", SearchDateEquipmentTypeEnum.TERMINATION_REQUEST.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateEquipmentTypeEnum.USE_REQUEST.getText());
		object.put("value", SearchDateEquipmentTypeEnum.USE_REQUEST.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/searchDateSecurityCheckTypes")
	@ApiOperation(value = "Get list of search date security check types", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSearchDateSecurityCheckTypes(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SearchDateSecurityCheckTypeEnum.ALL.getText());
		object.put("value", SearchDateSecurityCheckTypeEnum.ALL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateSecurityCheckTypeEnum.ENROLLMENT.getText());
		object.put("value", SearchDateSecurityCheckTypeEnum.ENROLLMENT.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateSecurityCheckTypeEnum.INACTIVE.getText());
		object.put("value", SearchDateSecurityCheckTypeEnum.INACTIVE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/messageStatuses")
	@ApiOperation(value = "Get list of message status", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getMessageStatuses(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", MessageStatusEnum.READ.getText());
		object.put("value", MessageStatusEnum.READ.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", MessageStatusEnum.UNREAD.getText());
		object.put("value", MessageStatusEnum.UNREAD.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/messageShippingTypes")
	@ApiOperation(value = "Get list of message shipping type", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getMessageShippingType(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", ShippingType.ONE_SHIPMENT.getText());
		object.put("value", ShippingType.ONE_SHIPMENT.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ShippingType.CYCLE_SENDING.getText());
		object.put("value", ShippingType.CYCLE_SENDING.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/messageDateOfShipments")
	@ApiOperation(value = "Get list of message date of shipment", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getMessageDateOfShipment(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", DateOfShipment.IMMEDIATELY.getText());
		object.put("value", DateOfShipment.IMMEDIATELY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", DateOfShipment.RESERVATION.getText());
		object.put("value", DateOfShipment.RESERVATION.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	@RequestMapping(method = RequestMethod.GET, value = "/equipmentProcesses")
	@ApiOperation(value = "Get list of equipment progress", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getEquipmentProcesses(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", EquipmentProgressEnum.WAITING_FOR_APPROVAL.getText());
		object.put("value", EquipmentProgressEnum.WAITING_FOR_APPROVAL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", EquipmentProgressEnum.IN_USE.getText());
		object.put("value", EquipmentProgressEnum.IN_USE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", EquipmentProgressEnum.EXIT_WAIT.getText());
		object.put("value", EquipmentProgressEnum.EXIT_WAIT.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", EquipmentProgressEnum.CANCELED.getText());
		object.put("value", EquipmentProgressEnum.CANCELED.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", EquipmentProgressEnum.END_USE.getText());
		object.put("value", EquipmentProgressEnum.END_USE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/businessScopes")
	@ApiOperation(value = "Get list of business scope", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getBusinessScopes(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", BusinessScopeEnum.ALL_WORK_IN_PROGRESS.getText());
		object.put("value", BusinessScopeEnum.ALL_WORK_IN_PROGRESS.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", BusinessScopeEnum.BUSINESS_CHOICE.getText());
		object.put("value", BusinessScopeEnum.BUSINESS_CHOICE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/securityEducationDivisions")
	@ApiOperation(value = "Get list of security education division", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSecurityEducationDivision(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SecurityEducationDivisionEnum.ONLINE.getText());
		object.put("value", SecurityEducationDivisionEnum.ONLINE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SecurityEducationDivisionEnum.OFFLINE.getText());
		object.put("value", SecurityEducationDivisionEnum.OFFLINE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/targetRoles")
	@ApiOperation(value = "Get list of target role", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getTargetRoles(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", TargetRoleEnum.ALL.getText());
		object.put("value", TargetRoleEnum.ALL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", TargetRoleEnum.PERFORMER.getText());
		object.put("value", TargetRoleEnum.PERFORMER.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", TargetRoleEnum.BUSINESS_MANAGER.getText());
		object.put("value", TargetRoleEnum.BUSINESS_MANAGER.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}	
	
	@RequestMapping(method = RequestMethod.GET, value = "/daysOfWeeks")
	@ApiOperation(value = "Get list of days of week", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getDaysOfWeek(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", DaysOfWeekEnum.MONDAY.getText());
		object.put("value", DaysOfWeekEnum.MONDAY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", DaysOfWeekEnum.TUESDAY.getText());
		object.put("value", DaysOfWeekEnum.TUESDAY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", DaysOfWeekEnum.WEDNESDAY.getText());
		object.put("value", DaysOfWeekEnum.WEDNESDAY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", DaysOfWeekEnum.THURSDAY.getText());
		object.put("value", DaysOfWeekEnum.THURSDAY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", DaysOfWeekEnum.FRIDAY.getText());
		object.put("value", DaysOfWeekEnum.FRIDAY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", DaysOfWeekEnum.SATURDAY.getText());
		object.put("value", DaysOfWeekEnum.SATURDAY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", DaysOfWeekEnum.SUNDAY.getText());
		object.put("value", DaysOfWeekEnum.SUNDAY.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}	
	
	@RequestMapping(method = RequestMethod.GET, value = "/cycles")
	@ApiOperation(value = "Get list of cycle", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getCycles(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", CycleEnum.BEFORE_START.getText());
		object.put("value", CycleEnum.BEFORE_START.name());
		list.add(object);
		

		object = new HashMap<>();
		object.put("name", CycleEnum.ONE_TIME.getText());
		object.put("value", CycleEnum.ONE_TIME.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CycleEnum.DAILY.getText());
		object.put("value", CycleEnum.DAILY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CycleEnum.WEEKLY.getText());
		object.put("value", CycleEnum.WEEKLY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CycleEnum.MONTHLY.getText());
		object.put("value", CycleEnum.MONTHLY.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}	
	
	@RequestMapping(method = RequestMethod.GET, value = "/inspectionTimes")
	@ApiOperation(value = "Get list of inspection time", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getInspectionTimes(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();


		object.put("name", InspectionTimeEnum.PERIOD.getText());
		object.put("value", InspectionTimeEnum.PERIOD.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", InspectionTimeEnum.COMPANY_REGISTRATION.getText());
		object.put("value", InspectionTimeEnum.COMPANY_REGISTRATION.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", InspectionTimeEnum.EMPLOYEE_REGISTRATION.getText());
		object.put("value", InspectionTimeEnum.EMPLOYEE_REGISTRATION.name());
		list.add(object);		
				
		object = new HashMap<>();
		object.put("name", InspectionTimeEnum.UPLOAD_A_FILE.getText());
		object.put("value", InspectionTimeEnum.UPLOAD_A_FILE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/terminationMethods")
	@ApiOperation(value = "Get list of termination method", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getTerminationMethods(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", TerminationMethodEnum.INSERTED_BY_EDITBOX.getText());
		object.put("value", TerminationMethodEnum.INSERTED_BY_EDITBOX.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", TerminationMethodEnum.RETURN.getText());
		object.put("value", TerminationMethodEnum.RETURN.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", TerminationMethodEnum.RETURN_WITH_FORMAT.getText());
		object.put("value", TerminationMethodEnum.RETURN_WITH_FORMAT.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", TerminationMethodEnum.REVOKE.getText());
		object.put("value", TerminationMethodEnum.REVOKE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", TerminationMethodEnum.TAKE_OUT.getText());
		object.put("value", TerminationMethodEnum.TAKE_OUT.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", TerminationMethodEnum.TAKE_OUT_AFTER_FORMAT.getText());
		object.put("value", TerminationMethodEnum.TAKE_OUT_AFTER_FORMAT.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", TerminationMethodEnum.TERMINATION_DELETE.getText());
		object.put("value", TerminationMethodEnum.TERMINATION_DELETE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", TerminationMethodEnum.TERMINATION_SHRED.getText());
		object.put("value", TerminationMethodEnum.TERMINATION_SHRED.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/productProgresses")
	@ApiOperation(value = "Get list of product process", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getProductProcess(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", ProductProgressEnum.WAITING_FOR_REGISTRATION.getText());
		object.put("value", ProductProgressEnum.WAITING_FOR_REGISTRATION.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ProductProgressEnum.WAITING_FOR_CONFIRMATION.getText());
		object.put("value", ProductProgressEnum.WAITING_FOR_CONFIRMATION.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", ProductProgressEnum.CONFIRMED.getText());
		object.put("value", ProductProgressEnum.CONFIRMED.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/securityViolationProgresses")
	@ApiOperation(value = "Get list of security violation progress", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSecurityViolationProcess(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SecurityViolationProgressEnum.WAIT_FOR_ACTION.getText());
		object.put("value", SecurityViolationProgressEnum.WAIT_FOR_ACTION.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SecurityViolationProgressEnum.ACTION_TAKEN.getText());
		object.put("value", SecurityViolationProgressEnum.ACTION_TAKEN.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SecurityViolationProgressEnum.APPROVED.getText());
		object.put("value", SecurityViolationProgressEnum.APPROVED.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/inspectionTimeSessions")
	@ApiOperation(value = "Get list of inspection time session", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getInspectionTimeSessions(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", InspectionTimeSessionEnum.MORNING.getText());
		object.put("value", InspectionTimeSessionEnum.MORNING.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", InspectionTimeSessionEnum.AFTERNOON.getText());
		object.put("value", InspectionTimeSessionEnum.AFTERNOON.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/securityViolationLevels")
	@ApiOperation(value = "Get list of security violation level", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSecurityViolationLevel(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();
		

		object.put("name", SecurityViolationLevelEnum.MINOR.getText());
		object.put("value", SecurityViolationLevelEnum.MINOR.name());
		list.add(object);		

		object = new HashMap<>();
		object.put("name", SecurityViolationLevelEnum.USUALLY.getText());
		object.put("value", SecurityViolationLevelEnum.USUALLY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SecurityViolationLevelEnum.COMPANY.getText());
		object.put("value", SecurityViolationLevelEnum.COMPANY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SecurityViolationLevelEnum.SERIOUS.getText());
		object.put("value", SecurityViolationLevelEnum.SERIOUS.name());
		list.add(object);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/securityEducationProgresses")
	@ApiOperation(value = "Get list of security education process", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSecurityEducationProgress(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object = new HashMap<>();
		object.put("name", SecurityEducationProgressEnum.REQUEST_FOR_COMPLETION.getText());
		object.put("value", SecurityEducationProgressEnum.REQUEST_FOR_COMPLETION.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SecurityEducationProgressEnum.COMPLETED.getText());
		object.put("value", SecurityEducationProgressEnum.COMPLETED.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SecurityEducationProgressEnum.APPROVED.getText());
		object.put("value", SecurityEducationProgressEnum.APPROVED.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/possessions")
	@ApiOperation(value = "Get list of possession", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getPossessions(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object = new HashMap<>();
		object.put("name", PossessionEnum.LABOR_WELFARE_CORPORATION.getText());
		object.put("value", PossessionEnum.LABOR_WELFARE_CORPORATION.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", PossessionEnum.PARTICIPANT.getText());
		object.put("value", PossessionEnum.PARTICIPANT.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/securityEducationCycles")
	@ApiOperation(value = "Get list of security education cycle", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSecurityEducationCycle(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", CycleEnum.BEFORE_START.getText());
		object.put("value", CycleEnum.BEFORE_START.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CycleEnum.ONE_TIME.getText());
		object.put("value", CycleEnum.ONE_TIME.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CycleEnum.DAILY.getText());
		object.put("value", CycleEnum.DAILY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CycleEnum.WEEKLY.getText());
		object.put("value", CycleEnum.WEEKLY.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", CycleEnum.MONTHLY.getText());
		object.put("value", CycleEnum.MONTHLY.name());
		list.add(object);
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/searchDateSecurityEducationTypes")
	@ApiOperation(value = "Get list of search date security education type", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSearchDateSecurityEducationType(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SearchDateSecurityEducationEnum.ALL.getText());
		object.put("value", SearchDateSecurityEducationEnum.ALL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateSecurityEducationEnum.TRAINING_REQUEST.getText());
		object.put("value", SearchDateSecurityEducationEnum.TRAINING_REQUEST.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateSecurityEducationEnum.COMPLETED_TRAINING.getText());
		object.put("value", SearchDateSecurityEducationEnum.COMPLETED_TRAINING.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateSecurityEducationEnum.APPROVE.getText());
		object.put("value", SearchDateSecurityEducationEnum.APPROVE.name());
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/searchDateProductTypes")
	@ApiOperation(value = "Get list of search date security education type", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getSearchDateProductType(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = new HashMap<>();

		object.put("name", SearchDateProductEnum.ALL.getText());
		object.put("value", SearchDateProductEnum.ALL.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateProductEnum.REGISTRATION_REQUEST.getText());
		object.put("value", SearchDateProductEnum.REGISTRATION_REQUEST.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateProductEnum.PRODUCT_REGISTRATION.getText());
		object.put("value", SearchDateProductEnum.PRODUCT_REGISTRATION.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateProductEnum.OK_APPROVE.getText());
		object.put("value", SearchDateProductEnum.OK_APPROVE.name());
		list.add(object);
		
		object = new HashMap<>();
		object.put("name", SearchDateProductEnum.DEADLINE.getText());
		object.put("value", SearchDateProductEnum.DEADLINE.name());
		list.add(object);
		
		list.add(object);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}
}
