package com.qlxdcb.clouvir.enums;

public enum ApiErrorEnum {

	FULLNAME_REQUIRED("Full name is required."),
	COMPANY_REQUIRED("Company is required."),
	TARGET_PROJECT_REQUIRED("Target project is required."),
	BUSINESS_SCOPE_REQUIRED("Business scope is required."),
	INSPECTION_TIME_REQUIRED("Inspection time is required."),
	CYCLE_REQUIRED("Cycle is required."),
	INSPECTION_TIME_SESSION_REQUIRED("Inspection time session is required."),
	HOUR_DOES_NOT_GREATER_THAN_12("Hour doesn't greater than 12."),
	MINUTE_DOES_NOT_GREATER_THAN_60("Minute doesn't greater than 60."),
	EQUIPMENT_KIND_REQUIRED("Equipment kind is required."),
	APPROVER_REQUIRED("Approver is required."),
	PROJECT_REQUIRED("Project is required."),
	PERFORMER_REQUIRED("Performer is required."),
	URL_REQUIRED("Url is required."),
	PASSWORD_REQUIRED("Password is required."),
	EMAIL_REQUIRED("Email is required."),
	FLOWID_REQUIRED("FlowId is required."),
	BUSINESS_NUMBER_REQUIRED("Business number is required."),
	INTERNAL_IP_REQUIRED("Internal IP is required."),
	CHECKLIST_COMPANY_REGISTRATION_REQUIRED("Check the list for company registration is required."),
	CHECKLIST_EMPLOYEE_REGISTRATION_REQUIRED("Check the list for company registration is required."),
	CHECKLIST_UPLOAD_FILE_REQUIRED("Check the list for upload file is required."),
	EXTERNAL_IP_REQUIRED("External IP is required."),
	RELATED_PROJECT_REQUIRED("Related project is required."),
	NAME_EXISTS("Name is exists."),
	TITLE_EXISTS("Title is exists."),
	EMAIL_EXISTS("Email is exists"),
	BUSINESS_NUMBER_EXISTS("Business number is exists"),
	IP_EXISTS("IP is exists"),
	COMPANY_NOT_EXISTS("Company is not exists"),
	ROLE_NOT_EXISTS("Role is not exists"),
	DATA_EXISTS("Data is exists"),
	DATA_NOT_FOUND("Data not found."),
	ROLE_FORBIDDEN("Your account can't access this function."),
	DATA_USED("Data is used."),
	EMAIL_INVALID("Email is invalid."),
	TOKEN_TIME_EXPIRED("Token time expired."),
	USER_NOT_ACTIVE("User not active."),
	URL_INVALID("Url is invalid."),
	DATA_INVALID("Data is invalid."),
	LOGIN_USER_PASSWORD_INCORRECT("Email or password incorrect."),
	OLD_PASSWORD_INCORRECT("Old password incorrect."),
	FILE_IMPORT_INCORRECT("File import incorrect."),
	NEW_PASSWORD_NOT_SAME("New password not same."),
	USER_NOT_EXISTS("This user does not exists."),
	LOGIN_INFOMATION_REQUIRED("Login infomation is required."),
	ADMIN_FORBIDDEN("Can't delete Superadmin account."),
	INTERNAL_SERVER_ERROR("Internal server error.");
	
	ApiErrorEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
