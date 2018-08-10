package com.eazymation.clouvir.enums;

public enum InvalidTokenStatusEnum {
	CHANGE_USER_INFOMATION("Change infomation of user"),
	CHANGE_USER_ROLE("Change role of user"),
	LOGIN("Login"),
	LOGOUT("Logout");
	
	InvalidTokenStatusEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
