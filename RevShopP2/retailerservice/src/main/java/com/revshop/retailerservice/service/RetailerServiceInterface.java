package com.revshop.retailerservice.service;

import java.util.List;

import com.revshop.retailerservice.entity.Order;
import com.revshop.retailerservice.entity.Product;
import com.revshop.retailerservice.entity.ProductReview;
//import java.util.List;
//import java.util.Optional;
//
//import com.revshop.retailerservice.entity.Category;
//import com.revshop.retailerservice.entity.Order;
//import com.revshop.retailerservice.entity.Product;
//import com.revshop.retailerservice.entity.ProductReview;
import com.revshop.retailerservice.entity.Retailer;

public interface RetailerServiceInterface {


	// Registers a new retailer
	int registerRetailer(Retailer retailer);

	// Handles the login for a retailer
	Retailer loginRetailer(Retailer retailer);

	// Retrieves a retailer by their email address
	Retailer getRetailerByEmail(String email);

	// Checks if the email is already in use by another retailer
	boolean isEmailAlreadyUsed(String email);
	
	
    // Method to add a product to a retailer
	Retailer addProductToRetailer(Long retailerId, Product product);

	
	int deleteProductById(Long productId); 
	
	List<Product> getProductsByRetailerId(Long retailerId);

	int ManageInventoryByProductId(Long productId, int newStockQuantity);
	
    // Get list of orders for a retailer
    List<Order> getOrdersByRetailerId(Long retailerId);

    // Update order status
    int updateOrderStatus(Long orderId, String newStatus);

    // Get list of reviews for a product
    List<ProductReview> getReviewsByProductId(Long productId);

    // Delete a product review by ID
    int deleteReviewById(Long reviewId);

    List<ProductReview> getReviewsByRetailerId(Long retailerId);
    
    int getTotalOrderCountByRetailerId(Long retailerId);
    
    int getTotalProductReviewCountByRetailerId(Long retailerId);

	int getTotalProductCountByRetailerId(Long retailerId);

	int updateProduct(Long retailerId, Product product);

	Product getProductById(Long retailerId, Long productId);

	Retailer getRetailerById(Long retailerId); 


    
    
    

	


}
