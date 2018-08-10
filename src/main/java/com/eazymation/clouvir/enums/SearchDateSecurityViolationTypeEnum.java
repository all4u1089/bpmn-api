package com.eazymation.clouvir.enums;

public enum SearchDateSecurityViolationTypeEnum {
	
	ALL("전체"),
	CORRECTIVE_REQUEST("시정요청"),
	MEASURE("조치"),
	APPROVE("확인/승인");
	
	
	SearchDateSecurityViolationTypeEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
