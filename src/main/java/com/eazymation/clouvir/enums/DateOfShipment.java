package com.eazymation.clouvir.enums;

public enum DateOfShipment {

	IMMEDIATELY("즉시"),
	RESERVATION("예약");
	
	DateOfShipment(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	private String text;
}
