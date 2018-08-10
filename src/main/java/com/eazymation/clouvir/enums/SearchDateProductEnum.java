package com.eazymation.clouvir.enums;

public enum SearchDateProductEnum {
	ALL("전체"),
	REGISTRATION_REQUEST("등록요청"),
	PRODUCT_REGISTRATION("산출물등록"),
	OK_APPROVE("확인/승인"),
	DEADLINE("마감");
	
	
	SearchDateProductEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
