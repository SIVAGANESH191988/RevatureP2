package com.revshop.retailerservice.dto;

import java.util.List;

public class OrderResponse {
	
    private Long orderId;
    private String orderStatus;
    private String shippingAddress;
    private String billingAddress;
    private double totalAmount;
    private String buyerName; // Add buyer name
    private List<OrderItemResponse> orderItems; // Add order items

    public OrderResponse(Long orderId, String orderStatus, String shippingAddress, String billingAddress, double totalAmount, String buyerName, List<OrderItemResponse> orderItems) {
        this.orderId = orderId;
        this.orderStatus = orderStatus;
        this.shippingAddress = shippingAddress;
        this.billingAddress = billingAddress;
        this.totalAmount = totalAmount;
        this.buyerName = buyerName;
        this.orderItems = orderItems;
    }

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(String billingAddress) {
		this.billingAddress = billingAddress;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public List<OrderItemResponse> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItemResponse> orderItems) {
		this.orderItems = orderItems;
	}

    
    
}
