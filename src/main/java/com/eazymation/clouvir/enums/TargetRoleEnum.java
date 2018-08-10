package com.eazymation.clouvir.enums;

public enum TargetRoleEnum {

	ALL("전체"),
	BUSINESS_MANAGER("사업관리자"),
	PERFORMER("수행관리자");
	
	TargetRoleEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
