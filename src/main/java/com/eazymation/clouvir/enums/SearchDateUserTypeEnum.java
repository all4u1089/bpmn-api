package com.eazymation.clouvir.enums;

public enum SearchDateUserTypeEnum {
	ALL("전체"),
	REGISTRATION_DATE("등록일"),
	RECENT_SIGNIN("최근로그인");
	
	
	SearchDateUserTypeEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
