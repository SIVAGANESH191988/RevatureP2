package com.revshop.buyerservice.dto;

public class CartItemDTO {
    private Long cartItemId;
    private String productName;
    private String image; 
    private int quantity;
    private double price;

    public CartItemDTO(Long cartItemId, String productName, int quantity, double price) {
        this.cartItemId = cartItemId;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters and setters
    public Long getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(Long cartItemId) {
        this.cartItemId = cartItemId;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}