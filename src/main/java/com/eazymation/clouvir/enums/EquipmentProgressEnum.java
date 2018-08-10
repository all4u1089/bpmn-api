package com.eazymation.clouvir.enums;

public enum EquipmentProgressEnum {

	WAITING_FOR_APPROVAL("승인대기"),
	IN_USE("사용중"),
	CANCELED("취소 된"),
	EXIT_WAIT("종료대기"),
	END_USE("사용종료");
	
	EquipmentProgressEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
