package com.eazymation.clouvir.enums;

public enum ProgressStepEnum {

	PLAN("기획"),
	PLANNING("계획수립"),
	BUSINESS_APPLICATION("사업자신청/계약"),
	CONDUCT_BUSINESS("사업수행"),
	INSPECTION_OPERATION("검사/운영"),
	PERFORMANCE_EVALUATION("성과평가");
	
	ProgressStepEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
