package com.eazymation.clouvir.enums;

public enum SecurityEducationProgressHistoryEnum {
	
	REQUEST_A_TRAINING_REQUEST("교육이수 요청"),
	COMPLETED_COURSE("이수완료"),
	UPDATE("업데이트"),
	VERIFICATION_AND_APPROVAL("확인 및 승인");
	
	SecurityEducationProgressHistoryEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
