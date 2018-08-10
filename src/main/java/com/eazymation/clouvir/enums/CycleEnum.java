package com.eazymation.clouvir.enums;

public enum CycleEnum {

	BEFORE_START("시작전"),
	ONE_TIME("일회"),
	DAILY("일간"),
	WEEKLY("주간"),
	MONTHLY("월간");
	
	CycleEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
