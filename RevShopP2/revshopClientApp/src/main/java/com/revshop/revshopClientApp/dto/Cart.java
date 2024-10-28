package com.revshop.revshopClientApp.dto;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;

public class Cart {

    private Long cartId;
    private List<CartItem> cartItems = new ArrayList<>();
    private Buyer buyer;



	public Long getCartId() {
		return cartId;
	}

	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}
    
    
    
    
}
