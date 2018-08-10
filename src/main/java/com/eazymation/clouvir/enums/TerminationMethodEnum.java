package com.eazymation.clouvir.enums;

public enum TerminationMethodEnum {

	RETURN_WITH_FORMAT("포맷 후 반납"),
	TERMINATION_SHRED("폐기(세절)"),
	TERMINATION_DELETE("폐기(삭제)"),
	REVOKE("사용종료"),
	TAKE_OUT_AFTER_FORMAT("포맷후반출"),
	TAKE_OUT("반출"),
	INSERTED_BY_EDITBOX("입력된 방법"),
	RETURN("반납");
	
	TerminationMethodEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
