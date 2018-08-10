package com.eazymation.clouvir.enums;

public enum SecurityCheckProgressHistoryEnum {

	SECURITY_CHECK_ITEM_REGISTRATION("보안점검 항목 등록"),
	UPDATE("업데이트"),
	CONFIRMATION("확인");
	
	SecurityCheckProgressHistoryEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
