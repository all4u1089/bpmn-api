package com.eazymation.clouvir.enums;

public enum SearchDateTypeEnum {
	ALL("전체"),
	START_DATE("시작일"),
	END_DATE("종료일");
	
	
	SearchDateTypeEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
