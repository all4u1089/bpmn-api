package com.eazymation.clouvir.enums;

public enum SecurityViolationProgressHistoryEnum {

	CORRECTIVE_REQUEST("보안위반사항 시정 요청"),
	CORRECTIVE_ACTION_REGISTRATION("시정조치 등록"),
	UPDATE("업데이트"),
	APPROVAL("확인 및 승인");
	
	SecurityViolationProgressHistoryEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
