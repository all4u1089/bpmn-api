package com.eazymation.clouvir.enums;

public enum DaysOfWeekEnum {

	MONDAY("월"),
	TUESDAY("화"),
	WEDNESDAY("수"),
	THURSDAY("목"),
	FRIDAY("금"),
	SATURDAY("토"),
	SUNDAY("일");
	
	DaysOfWeekEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
