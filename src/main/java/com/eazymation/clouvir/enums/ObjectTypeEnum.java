package com.eazymation.clouvir.enums;

public enum ObjectTypeEnum {

	COMPANY("Company"),
	PROJECT("Project"),
	EQUIPMENT("Equipment"),
	PRODUCT("Equipment"),
	USER("User"),
	SECURITY_VIOLATION("Security violation"),
	SECURITY_EDUCATION("Security education"),
	TRAINING_HISTORY("Training history"),
	HELP("Help");
	ObjectTypeEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
