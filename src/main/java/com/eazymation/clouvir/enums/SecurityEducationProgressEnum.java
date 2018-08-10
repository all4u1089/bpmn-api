package com.eazymation.clouvir.enums;

public enum SecurityEducationProgressEnum {
	REQUEST_FOR_COMPLETION("이수요청"),
	COMPLETED("이수완료"),
	APPROVED("승인됨");
	
	SecurityEducationProgressEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
