package com.eazymation.clouvir.enums;

public enum MessageTypeEnum {
	MESSAGE("m"),
	VIOLATION("w"),
	PRODUCT("n"),
	CHECKLIST("c"),
	EDUCATION("r");
	
	MessageTypeEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
