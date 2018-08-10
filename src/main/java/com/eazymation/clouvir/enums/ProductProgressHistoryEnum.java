package com.eazymation.clouvir.enums;

public enum ProductProgressHistoryEnum {

	REQUEST_FOR_PRODUCT_REGISTRATION("산출물 등록 요청"),
	REGISTER_THE_OUTPUT_FILE("산출물 파일 등록"),
	UPDATE("업데이트"),
	VERIFICATION_AND_APPROVAL("확인 및 승인");
	
	ProductProgressHistoryEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
