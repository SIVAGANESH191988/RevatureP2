package com.revshop.retailerservice.service;

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

	public void setProductName(String productName) {
		this.productName = productName;
	}

}
