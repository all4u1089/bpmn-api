package com.eazymation.clouvir.enums;

public enum SecurityViolationProgressEnum {

	WAIT_FOR_ACTION("조치대기"),
	ACTION_TAKEN("조치됨"),
	APPROVED("승인됨");
	
	SecurityViolationProgressEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
