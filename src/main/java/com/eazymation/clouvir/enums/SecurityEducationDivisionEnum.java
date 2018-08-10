package com.eazymation.clouvir.enums;

public enum SecurityEducationDivisionEnum {

	ONLINE("온라인 교육"),
	OFFLINE("오프라인 교육");
	
	SecurityEducationDivisionEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
