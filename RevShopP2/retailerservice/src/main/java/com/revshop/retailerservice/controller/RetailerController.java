package com.revshop.retailerservice.controller;


import java.util.List;

import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;


import com.revshop.retailerservice.dto.OrderItemResponse;
import com.revshop.retailerservice.dto.OrderResponse;
import com.revshop.retailerservice.entity.Order;

import com.revshop.retailerservice.entity.Product;
import com.revshop.retailerservice.entity.ProductReview;
import com.revshop.retailerservice.entity.Retailer;
import com.revshop.retailerservice.service.RetailerServiceInterface;


@RestController
@CrossOrigin("http://localhost:8084/")
@RequestMapping("/retailer")
public class RetailerController {

	@Autowired
	private RetailerServiceInterface retailerService;
    
	

	@PostMapping("/register")
	public ResponseEntity<String> registerRetailer(@RequestBody Retailer retailer) {
		if (retailerService.isEmailAlreadyUsed(retailer.getEmail())) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body("Email is already in use. Please choose another.");
		}
		int result = retailerService.registerRetailer(retailer);
		return result == 1 ? ResponseEntity.ok("Retailer registered successfully.")
				: ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to register retailer.");
	}

	// Login method
	@PostMapping("/login")
	public ResponseEntity<?> loginRetailer(@RequestBody Retailer retailer) {
		try {
			Retailer loggedInRetailer = retailerService.loginRetailer(retailer);

			// Create response based on the logged-in retailer
			Retailer response = new Retailer();
			response.setRetailerId(loggedInRetailer.getRetailerId());
			response.setBusinessName(loggedInRetailer.getBusinessName());
			response.setEmail(loggedInRetailer.getEmail());
			response.setPassword(loggedInRetailer.getPassword());
			response.setContactNo(loggedInRetailer.getContactNo());
			response.setApproved(loggedInRetailer.isApproved());
			response.setBlocked(loggedInRetailer.isBlocked());

			return ResponseEntity.ok(response); // Return the retailer object if login is successful
		} catch (RuntimeException e) {
			// Handle different exception messages for specific login issues
			if (e.getMessage().equals("Account is blocked.")) {
				return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Account is blocked."); // Forbidden
			} else if (e.getMessage().equals("Account is not approved.")) {
				return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Account is not approved."); // Forbidden
			} else {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Email or password wrong"); // Unauthorized
			}
		}
	}

	// Get total order count for a retailer
	@GetMapping("/{retailerId}/orders/count")
	public ResponseEntity<Integer> getTotalOrderCount(@PathVariable Long retailerId) {
		int orderCount = retailerService.getTotalOrderCountByRetailerId(retailerId);
		return ResponseEntity.ok(orderCount);
	}

	@GetMapping("/productReviewsCount/{retailerId}")
	public ResponseEntity<Integer> getTotalProductReviewCount(@PathVariable Long retailerId) {
		int reviewCount = retailerService.getTotalProductReviewCountByRetailerId(retailerId);
		return new ResponseEntity<>(reviewCount, HttpStatus.OK);
	}

	@GetMapping("/{retailerId}/products/count")
	public ResponseEntity<Integer> getTotalProductCount(@PathVariable Long retailerId) {
		int productCount = retailerService.getTotalProductCountByRetailerId(retailerId);
		return new ResponseEntity<>(productCount, HttpStatus.OK);
	}

	// Get list of reviews for a product // Not used 
	@GetMapping("/productsreviews/{productId}")
	public ResponseEntity<List<ProductReview>> getReviews(@PathVariable Long productId) {
		List<ProductReview> reviews = retailerService.getReviewsByProductId(productId);
		if (!reviews.isEmpty()) {
			return ResponseEntity.ok(reviews);
		} else {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
		}
	}

	// Delete a review
	@DeleteMapping("/{retailerId}/reviews/{reviewId}")
	public ResponseEntity<String> deleteReview(@PathVariable Long retailerId, @PathVariable Long reviewId) {
		System.out.println("Attempting to delete review with ID: " + reviewId + " for retailer ID: " + retailerId);
		int result = retailerService.deleteReviewById(reviewId);
		if (result == 1) {
			return ResponseEntity.ok("Review deleted successfully.");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Review not found.");
		}
	}

	@GetMapping("/{retailerId}/reviews")
	public ResponseEntity<List<ProductReview>> getReviewsByRetailerId(@PathVariable Long retailerId) {
		List<ProductReview> reviews = retailerService.getReviewsByRetailerId(retailerId);

		if (!reviews.isEmpty()) {
			List<ProductReview> response = reviews.stream().map(review -> {
				ProductReview result = new ProductReview();
				result.setReviewId(review.getReviewId());
				result.setReviewText(review.getReviewText());
				result.setRating(review.getRating()); // Assuming you have a rating field
				result.setBuyer(review.getBuyer()); // This should be the buyer's name
				result.setRetailer(review.getRetailer()); // Get retailer business name
				result.setProduct(review.getProduct());
				return result;
			}).collect(Collectors.toList());

			return ResponseEntity.ok(response);
		} else {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
		}
	}

	@GetMapping("/orders/{retailerId}")
	public ResponseEntity<List<OrderResponse>> getAllOrder(@PathVariable Long retailerId) {
		List<Order> orders = retailerService.getOrdersByRetailerId(retailerId);

		if (!orders.isEmpty()) {
			List<OrderResponse> responseList = orders.stream().map(order -> {
				String buyerName = order.getBuyer() != null ? order.getBuyer().getName() : "N/A"; // Assuming getName()
																									// is a method in
																									// Buyer class
				List<OrderItemResponse> orderItemResponses = order.getOrderItems().stream()
						.map(orderItem -> new OrderItemResponse(orderItem.getProduct().getProductName(),
								orderItem.getQuantity())) // Assuming getProduct() returns Product
						.collect(Collectors.toList());

				return new OrderResponse(order.getOrderId(), order.getOrderStatus(), order.getShippingAddress(),
						order.getBillingAddress(), order.getTotalAmount(), buyerName, orderItemResponses);
			}).collect(Collectors.toList());

			return new ResponseEntity<>(responseList, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
	}

	// Update order status
	@PutMapping("/orders/{orderId}/status")
	public ResponseEntity<String> updateOrderStatus(@PathVariable Long orderId, @RequestBody String newStatus) {
		int result = retailerService.updateOrderStatus(orderId, newStatus);
		if (result == 1) {
			return ResponseEntity.ok("Order status updated successfully.");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Order not found.");
		}
	}

	@GetMapping("/retailerproducts/{retailerId}")
	public ResponseEntity<List<Product>> getProductsByRetailerId(@PathVariable Long retailerId) {
		List<Product> products = retailerService.getProductsByRetailerId(retailerId);
		if (!products.isEmpty()) {
			return new ResponseEntity<>(products, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
	}

	// Delete a product by ID
	@DeleteMapping("/delete/{productId}")
	public ResponseEntity<String> deleteProduct(@PathVariable Long productId) {
		int result = retailerService.deleteProductById(productId);
		if (result == 1) {
			return new ResponseEntity<>("Product deleted successfully.", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("Product not found.", HttpStatus.NOT_FOUND);
		}
	}

	@PostMapping("/{retailerId}/addproducts")
	public ResponseEntity<String> saveProduct(@PathVariable Long retailerId, @RequestBody Product product) {
		try {
			// Call the service method to add the product to the retailer
			Retailer retailer = retailerService.addProductToRetailer(retailerId, product);
			return new ResponseEntity<>("Product added successfully to retailer: " + retailer.getRetailerId(),
					HttpStatus.OK);
		} catch (RuntimeException e) {
			// Handle retailer not found exception
			return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			// Handle other exceptions
			return new ResponseEntity<>("An unexpected error occurred: " + e.getMessage(),
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PutMapping("/{retailerId}/updateProduct/{productId}")
	public ResponseEntity<String> updateProduct(@PathVariable Long retailerId, @PathVariable Long productId,
			@RequestBody Product product) {
		product.getProductName();
		product.getDescription();
		product.setProductId(productId);

		int result = retailerService.updateProduct(retailerId, product); // Make sure your service method matches this

		if (result == 1) {
			return ResponseEntity.ok("Product updated successfully.");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found.");
		}
	}

	@GetMapping("/{retailerId}/product/{productId}")
	public ResponseEntity<Product> getProductById(@PathVariable Long retailerId, @PathVariable Long productId) {
	    try {
	        // Fetch the product details
	        Product product = retailerService.getProductById(retailerId, productId);
	        
	        // Optionally check if the product belongs to the retailer
	        if (!product.getRetailer().getRetailerId().equals(retailerId)) {
	            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(null); // Not allowed
	        }
	        
	        return ResponseEntity.ok(product); // Return product details
	    } catch (RuntimeException e) {
	        // Handle product not found exception
	        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
	    } catch (Exception e) {
	        // Handle other exceptions
	        return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}

	// Manage inventory for a product by ID
	@PutMapping("/manage-inventory/{productId}")
	public ResponseEntity<String> manageInventory(@PathVariable Long productId, @RequestBody int newStockQuantity) {
		int result = retailerService.ManageInventoryByProductId(productId, newStockQuantity);
		if (result == 1) {
			return new ResponseEntity<>("Inventory managed successfully.", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("Product not found.", HttpStatus.NOT_FOUND);
		}
	}
}
