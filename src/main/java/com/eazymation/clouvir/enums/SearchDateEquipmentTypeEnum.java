package com.eazymation.clouvir.enums;

public enum SearchDateEquipmentTypeEnum {
	
	ALL("전체"),
	USE_REQUEST("사용요청"),
	AUTHORIZATION_TO_USE("사용승인"),
	TERMINATION_REQUEST("종료요청"),
	END_APPROVAL("종료승인");
	
	
	SearchDateEquipmentTypeEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
