package com.revshop.buyerservice.service;

import java.util.List;

import com.revshop.buyerservice.entity.Buyer;
import com.revshop.buyerservice.entity.Cart;
import com.revshop.buyerservice.entity.CartItem;
import com.revshop.buyerservice.entity.FavoriteProduct;
import com.revshop.buyerservice.entity.Order;
import com.revshop.buyerservice.entity.Product;
import com.revshop.buyerservice.entity.ProductReview;

public interface BuyerServiceInterface {
	
	int registerBuyer(Buyer buyer);

	Buyer loginBuyer(Buyer buyer);
	
	List<Product> getAllProducts();
	
	Product getProductById(long productId);

	Buyer getBuyerByEmail(String email);
	
	Cart getCartByBuyerId(Long buyerId);

	Buyer getBuyerById(Long buyerId);

	void addToCart( Cart cart);

	void saveCart(Cart cart);

	Order placeOrder(Cart cart);

	void deleteCartItemById(Long cartItemId);

	String getAddressById(Long buyerId);

	ProductReview addProductReview(ProductReview productReview);

	FavoriteProduct addFavoriteProduct(Long buyerId, Long productId);

	List<FavoriteProduct> getFavoritesByBuyer(Long buyerId);





}
