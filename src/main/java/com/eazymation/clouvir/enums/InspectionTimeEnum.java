package com.eazymation.clouvir.enums;

public enum InspectionTimeEnum {

	PERIOD("기간 ( 특정 시점과 무관 )"),
	COMPANY_REGISTRATION("업체 등록"),
	EMPLOYEE_REGISTRATION("직원 등록"),
	UPLOAD_A_FILE("파일 업로드");
	
	InspectionTimeEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
