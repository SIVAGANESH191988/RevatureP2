package com.revshop.retailerservice.dto;

public class OrderItemResponse {

    private String productName;
    private int quantity;

    public OrderItemResponse(String productName, int quantity) {
        this.productName = productName;
        this.quantity = quantity;
    }

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
    
    
}
