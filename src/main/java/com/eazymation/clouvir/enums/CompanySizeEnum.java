package com.eazymation.clouvir.enums;

public enum CompanySizeEnum {

	LESS_THAN_5("5인 이하"),
	FROM_6_TO_10("6~10인"),
	FROM_11_TO_30("11~30인"),
	FROM_31_TO_50("31~50인"),
	FROM_51_TO_100("51~100인"),
	FROM_101_TO_300("100~300인"),
	MORE_THAN_300("300인 이상");
	
	CompanySizeEnum(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
