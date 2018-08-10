package com.eazymation.clouvir.enums;

public enum SearchDateSecurityEducationEnum {
	ALL("전체"),
	TRAINING_REQUEST("교육요청"),
	COMPLETED_TRAINING("교육완료"),
	APPROVE("확인/승인");
	
	SearchDateSecurityEducationEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
