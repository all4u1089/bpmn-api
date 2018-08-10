package com.eazymation.clouvir.enums;

public enum FileTypeEnum {

	REFERENCE("Reference"),
	PHOTO_FILE("Photo file"),
	OUTPUT("Output"),
	RELATED_FILE("Related file"),
	EVIDENCE_FILE("Evidence file"),
	SECURITY_PLEDGE("Security pledge"),
	SECURITY_PLEDGE_AFTER("Security pledge after");
	
	FileTypeEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
