package com.eazymation.clouvir.enums;

public enum MessageContentEnum {
	NEW_MESSAGE("신규 메시지가 있습니다"),
	NEW_SECURITY_VIOLATION("보안 위반사항이 있습니다"),
	CONFIRM_SECURITY_VIOLATION("보안 위반 조치를 관리자가 확인했습니다"),
	NEW_CHECKLIST("보안 점검 사항이 있습니다"),
	CONFIRM_CHECKLIST("보안 점검 사항을 관리자가 확인했습니다"),
	NEW_PRODUCT("산춞물 요청이 있습니다"),
	CONFIRM_PRODUCT("제출된 산출물을 관리자가 확인했습니다"),
	NEW_EDUCATION("보안 교육 이수가 요청되었습니다"),
	CONFIRM_EDUCATION("보안 교육 결과를 관리자가 확인했습니다");
	
	MessageContentEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
