package com.eazymation.clouvir.enums;

public enum PowerEnum {	
		
	EMPLOYEE_LIST("List"),
	EMPLOYEE_VIEW("View"),
	EMPLOYEE_ADD("Add"),
	EMPLOYEE_UPDATE("Update"),
	EMPLOYEE_DELETE("Delete"),
	
	EMPLOYER_LIST("List"),
	EMPLOYER_VIEW("View"),
	EMPLOYER_ADD("Add"),
	EMPLOYER_UPDATE("Update"),
	EMPLOYER_DELETE("Delete"),
	
	ROLE_LIST("List"),
	ROLE_VIEW("View"),
	ROLE_ADD("Add"),
	ROLE_UPDATE("Update"),
	ROLE_DELETE("Delete"),	
	
	COMPANY_LIST("List"),
	COMPANY_VIEW("View"),
	COMPANY_ADD("Add"),
	COMPANY_UPDATE("Update"),
	COMPANY_DELETE("Delete"),
	
	HELP_LIST("List"),
	HELP_VIEW("View"),
	HELP_ADD("Add"),
	HELP_UPDATE("Update"),
	HELP_DELETE("Delete"),
	
	PROJECT_LIST("List"),
	PROJECT_VIEW("View"),
	PROJECT_ADD("Add"),
	PROJECT_UPDATE("Update"),
	PROJECT_DELETE("Delete"),
	
	PRODUCT_LIST("List"),
	PRODUCT_VIEW("View"),
	PRODUCT_ADD("Add"),
	PRODUCT_UPDATE("Update"),
	PRODUCT_REGISTER("Register"),
	PRODUCT_CONFIRM("Confirm"),
	PRODUCT_DELETE("Delete"),
	
	EQUIPMENTKIND_LIST("List"),
	EQUIPMENTKIND_VIEW("View"),
	EQUIPMENTKIND_ADD("Add"),
	EQUIPMENTKIND_UPDATE("Update"),
	EQUIPMENTKIND_DELETE("Delete"),
	
	SETTING_VIEW("View"),
	SETTING_UPDATE("Update"),
	
	SECURITYVIOLATION_LIST("List"),
	SECURITYVIOLATION_VIEW("View"),
	SECURITYVIOLATION_ADD("Add"),
	SECURITYVIOLATION_UPDATE("Update"),
	SECURITYVIOLATION_DOACTION("Do action with security violations"),
	SECURITYVIOLATION_DELETE("Delete"),
	
	SECURITYEDUCATION_LIST("List"),
	SECURITYEDUCATION_VIEW("View"),
	SECURITYEDUCATION_ADD("Add"),
	SECURITYEDUCATION_UPDATE("Update"),
	SECURITYEDUCATION_CONFIRMREQUEST("Confirm security education request"),
	SECURITYEDUCATION_REGISTERCOMPLETION("Register security education completion"),
	SECURITYEDUCATION_CONFIRMCOMPLETION("Confirm security education completion"),
	SECURITYEDUCATION_DELETE("Delete"),
	
	SECURITYCHECK_LIST("List"),
	SECURITYCHECK_VIEW("View"),
	SECURITYCHECK_ADD("Add"),
	SECURITYCHECK_UPDATE("Update"),
	SECURITYCHECK_DELETE("Delete"),
	
	MESSAGE_LIST("List"),
	MESSAGE_VIEW("View"),
	MESSAGE_ADD("Add"),
	MESSAGE_DELETE("Delete"),
	
	MESSAGERECEIVER_LIST("List"),
	MESSAGERECEIVER_VIEW("View"),
	MESSAGERECEIVER_DELETE("Delete"),
	
	EQUIPMENT_LIST("List"),
	EQUIPMENT_VIEW("View"),
	EQUIPMENT_ADD("Add"),
	EQUIPMENT_UPDATE("Update"),
	EQUIPMENT_CONFIRMUSAGE("Confirm equipment usage"),
	EQUIPMENT_REQUESTTERMINATION("Request equipment termination"),
	EQUIPMENT_CONFIRMTERMINATION("Confirm equipment termination"),
	EQUIPMENT_DELETE("Delete");
	
	PowerEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
