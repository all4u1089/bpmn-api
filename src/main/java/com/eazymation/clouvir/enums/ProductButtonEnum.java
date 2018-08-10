package com.eazymation.clouvir.enums;

public enum ProductButtonEnum {
	CONFIRMED("승인");
	
	ProductButtonEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
