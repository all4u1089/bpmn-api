package com.eazymation.clouvir.enums;

public enum RoleTypeEnum {

	SUPER_ADMIN("Super Admin"),
	SECURITY_MANAGER("Security Manager"),
	PROJECT_ADMIN("Project Admin"),
	PROJECT_MANAGER("Project Manager"),
	WORKER("Worker");
	
	RoleTypeEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
