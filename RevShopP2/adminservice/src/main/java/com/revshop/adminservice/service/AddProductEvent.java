package com.revshop.adminservice.service;

public class AddProductEvent {
	private String productName ;

	AddProductEvent(){
		
	}
	
	AddProductEvent(String productName) {
		this.productName = productName;
	}

	public String getProductName() {
		return productName;
	}

	public void getProductName(String productName) {
		this.productName = productName;
	}
}
