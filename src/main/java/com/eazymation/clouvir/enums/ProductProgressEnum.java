package com.eazymation.clouvir.enums;

public enum ProductProgressEnum {

	WAITING_FOR_REGISTRATION("등록대기"),
	WAITING_FOR_CONFIRMATION("등록됨"),
	CONFIRMED("승인됨");
	
	ProductProgressEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
