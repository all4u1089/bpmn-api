package com.eazymation.clouvir.enums;

public enum ShippingType {

	ONE_SHIPMENT("1회 발송"),
	CYCLE_SENDING("주기 발송");
	
	ShippingType(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
