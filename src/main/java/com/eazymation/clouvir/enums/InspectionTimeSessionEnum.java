package com.eazymation.clouvir.enums;

public enum InspectionTimeSessionEnum {

	MORNING("오전"),
	AFTERNOON("오후");
	
	InspectionTimeSessionEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
