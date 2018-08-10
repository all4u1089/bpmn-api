package com.eazymation.clouvir.enums;

public enum SecurityEducationButtonEnum {
	APPROVED("확인/승인");
	
	SecurityEducationButtonEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
