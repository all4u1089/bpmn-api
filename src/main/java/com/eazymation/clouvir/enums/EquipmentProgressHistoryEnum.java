package com.eazymation.clouvir.enums;

public enum EquipmentProgressHistoryEnum {

	USE_REQUEST("사용요청"),
	AUTHORIZATION_TO_USE("사용승인"),
	UPDATE("업데이트"),
	CANCEL("취소"),
	TERMINATION_REQUEST("종료요청"),
	END_APPROVAL("종료승인");
	
	EquipmentProgressHistoryEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
