package com.eazymation.clouvir.enums;

public enum EquipmentButtonEnum {

	CANCEL_REQUEST("요청 취소"),
	REQUEST_FOR_TERMINATION("종료 요청"),
	APPROVE_REQUEST("사용승인"),
	APPROVE_TERMINATION("종료 승인");
	
	EquipmentButtonEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
