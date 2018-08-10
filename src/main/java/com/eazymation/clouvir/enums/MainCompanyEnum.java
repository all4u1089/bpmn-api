package com.eazymation.clouvir.enums;

public enum MainCompanyEnum {

	LABOR_WELFARE_CORPORATION("근로복지공단");
	
	MainCompanyEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
