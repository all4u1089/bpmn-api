package com.eazymation.clouvir.enums;


public enum ContractStatusEnum {
	BEFORE_CONTRACT("계약전"),
	UNDER_CONTRACT("계약중"),
	END("종료");
	
	
	ContractStatusEnum(String text) {
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	private String text;
}
