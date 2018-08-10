package com.eazymation.clouvir.enums;

public enum SecurityViolationLevelEnum {

	MINOR("경미"),
	USUALLY("보통"),
	COMPANY("중대"),
	SERIOUS("심각");
	
	SecurityViolationLevelEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
