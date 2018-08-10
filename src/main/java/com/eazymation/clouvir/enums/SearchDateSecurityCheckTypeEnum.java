package com.eazymation.clouvir.enums;

public enum SearchDateSecurityCheckTypeEnum {
	
	ALL("전체"),
	ENROLLMENT("등록"),
	INACTIVE("점검완료");
	
	
	SearchDateSecurityCheckTypeEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
