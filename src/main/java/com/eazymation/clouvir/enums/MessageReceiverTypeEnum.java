package com.eazymation.clouvir.enums;

public enum MessageReceiverTypeEnum {
	NORMAL("Normal"),
	USER_CHECK_HISTORY("User check"),
	SECURITY_VIOLATION("Security violation");
	
	MessageReceiverTypeEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
