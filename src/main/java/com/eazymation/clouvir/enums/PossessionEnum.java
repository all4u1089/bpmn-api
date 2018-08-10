package com.eazymation.clouvir.enums;

public enum PossessionEnum {

	LABOR_WELFARE_CORPORATION("근로복지공단"),
	PARTICIPANT("참여사");
	
	PossessionEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
