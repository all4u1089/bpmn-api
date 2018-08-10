package com.eazymation.clouvir.enums;

public enum MessageStatusEnum {
	READ("읽음"),
	UNREAD("읽지 않음");
	MessageStatusEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
