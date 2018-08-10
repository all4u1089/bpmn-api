package com.eazymation.clouvir.enums;

public enum SearchDateCompanyEnum {
	ALL("전체"),
	REGISTRATION_DATE("등록일"),
	CONTACT_END_DATE("계약종료일");
	
	SearchDateCompanyEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
