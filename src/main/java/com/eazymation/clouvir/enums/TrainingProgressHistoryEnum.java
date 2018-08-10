package com.eazymation.clouvir.enums;

public enum TrainingProgressHistoryEnum {
	COMPLETED("이수완료"),
	INCOMPLETED("완료되지 않음");
	
	TrainingProgressHistoryEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
