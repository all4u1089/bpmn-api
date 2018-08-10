package com.eazymation.clouvir.enums;

public enum SecurityViolationButtonEnum {
	
	APPROVE("확인/승인");
	
	SecurityViolationButtonEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
