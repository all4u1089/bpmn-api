package com.eazymation.clouvir.enums;

public enum SecurityCheckProgressEnum {

	ACTIVATION("활성"),
	INACTIVE("비활성");
	
	SecurityCheckProgressEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
