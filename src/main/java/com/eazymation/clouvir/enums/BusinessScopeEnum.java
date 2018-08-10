package com.eazymation.clouvir.enums;

public enum BusinessScopeEnum {

	ALL_WORK_IN_PROGRESS("진행중인 모든 사업"),
	BUSINESS_CHOICE("사업선택");
	
	BusinessScopeEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
