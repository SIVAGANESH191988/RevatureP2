package com.revshop.buyerservice.service;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.revshop.buyerservice.dao.BuyerRepository;
import com.revshop.buyerservice.dao.CartRepository;
import com.revshop.buyerservice.dao.FavoriteProductRepository;
import com.revshop.buyerservice.dao.OrderRepository;
import com.revshop.buyerservice.dao.ProductDAO;
import com.revshop.buyerservice.dao.ProductRepository;
import com.revshop.buyerservice.dao.ProductReviewRepository;
import com.revshop.buyerservice.entity.Buyer;
import com.revshop.buyerservice.entity.Cart;
import com.revshop.buyerservice.entity.CartItem;
import com.revshop.buyerservice.entity.FavoriteProduct;
import com.revshop.buyerservice.entity.Order;
import com.revshop.buyerservice.entity.OrderItem;
import com.revshop.buyerservice.entity.Product;
import com.revshop.buyerservice.entity.ProductReview;
import com.revshop.buyerservice.entity.Retailer;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class BuyerService implements BuyerServiceInterface {
	
	
	@Autowired
    private BuyerRepository buyerRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CartRepository cartRepository;

  
    @Autowired
    private OrderRepository orderRepository;
    
    @Autowired
    private ProductReviewRepository productReviewRepo;
    
    @Autowired
    private FavoriteProductRepository favoriteProductRepo;

	@Override
	public int registerBuyer(Buyer buyer) {
		
		// Check if the email already exists
		if (buyerRepository.existsByEmail(buyer.getEmail())) {
			return 0; // Email already exists
		}
		buyerRepository.save(buyer); // Save the new retailer
		return 1; // Success
	}

	@Override
	public Buyer loginBuyer(Buyer buyer) {

	    Buyer existingBuyerOptional = buyerRepository.findByEmail(buyer.getEmail());

	   

	        // Check if the password matches
	        if (existingBuyerOptional.getPassword().equals(buyer.getPassword())) {

	            if (existingBuyerOptional.isBlocked()) {
	                // Account is blocked
	                throw new RuntimeException("Account is blocked.");
	            } else {
	                // Successful login
	                return existingBuyerOptional;
	            }
	        } else {
	            // Incorrect password
	            throw new RuntimeException("Invalid email or password.");
	        }
	    } 
	    
	
	
    @Override
    public List<Product> getAllProducts() {
    	
    	List<Product> products = productRepository.findAll();
        // Extract just the image filenames
        for (Product product : products) {
            String fullPath = product.getImage(); // Get the full path from the entity
            String imageName = new File(fullPath).getName(); // Extract just the filename
            product.setImage(imageName); // Set only the filename
        }

        return products;
    }
    

    public Product getProductById(Long productId) {
        return productRepository.findById(productId).orElse(null);
    }
    @Override
    public Product getProductById(long productId) {
        return productRepository.findById(productId).orElse(null);
        
    }

    @Override
    public Buyer getBuyerByEmail(String email) {
        return buyerRepository.findByEmail(email);
    }

    @Override
    public Cart getCartByBuyerId(Long buyerId) {
        Buyer buyer = buyerRepository.findById(buyerId).orElse(null);
        return buyer != null ? cartRepository.findByBuyer(buyer) : null;
    }

    @Override
    public Buyer getBuyerById(Long buyerId) {
        return buyerRepository.findById(buyerId).orElse(null);
    }
    
    @Override
    public void addToCart(Cart newCart) {
        // Fetch the existing cart for the buyer
        Cart existingCart = cartRepository.findByBuyer(newCart.getBuyer());

        if (existingCart == null) {
            // If no existing cart, save the new cart
            cartRepository.save(newCart);
        } else {
            // Loop through the new cart items
            for (CartItem newItem : newCart.getCartItems()) {
                // Find the existing cart item that matches the product
                Optional<CartItem> existingItemOpt = existingCart.getCartItems().stream()
                    .filter(item -> item.getProduct().getProductId().equals(newItem.getProduct().getProductId()))
                    .findFirst();

                if (existingItemOpt.isPresent()) {
                    // If the product exists in the cart, update the quantity
                    CartItem existingItem = existingItemOpt.get();
                    existingItem.setQuantity(existingItem.getQuantity() + newItem.getQuantity());
                } else {
                    // If the product doesn't exist in the cart, add the new item
                    newItem.setCart(existingCart); // Set the relationship to the cart
                    existingCart.getCartItems().add(newItem);
                }
            }
            // Save the updated cart to persist changes
            cartRepository.save(existingCart);
        }
    }



    @Override
    public void saveCart(Cart cart) {
        cartRepository.save(cart);
    }
    

    @Override
    public void deleteCartItemById(Long cartItemId) {
        cartRepository.deleteById(cartItemId);
    }

    
    
    @Override
    public Order placeOrder(Cart cart) {
        Order order = new Order();

        // Set the buyer from the cart
        order.setBuyer(cart.getBuyer());

        // Fetch the retailer from the first product in the cart
        if (!cart.getCartItems().isEmpty()) {
            Retailer retailer = cart.getCartItems().get(0).getProduct().getRetailer(); // Assuming all items are from the same retailer
            order.setRetailer(retailer); // Set the retailer for the order
        }

        // Set other order properties
        order.setOrderStatus("Pending");
        order.setShippingAddress(cart.getBuyer().getCity()); // Assuming you have a method to get the shipping address
        order.setBillingAddress(cart.getBuyer().getCity());  // Assuming you have a method to get the billing address
        order.setTotalAmount(calculateTotalAmount(cart));    // Method to calculate total amount
              

        // Create OrderItems from CartItems
        List<OrderItem> orderItems = new ArrayList<>();
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setOrder(order);  // Set the order reference in the order item
            orderItems.add(orderItem);  // Add order item to the list
            
            // Reduce the stock of the product
            Product product = cartItem.getProduct();
            product.setStockQuantity(product.getStockQuantity()- cartItem.getQuantity()); // Assuming there's a setStock method in Product
            productRepository.save(product); // Save updated product stock
        }

        order.setOrderItems(orderItems);  // Set the order items to the order

        // Save the order with all items
        Order savedOrder = orderRepository.save(order);

        // Clear the cart after placing the order
        cart.getCartItems().clear(); // Clear cart items
        cartRepository.save(cart); // Save the empty cart if you want to keep the cart object

        return savedOrder;
    }





    // Method to calculate the total amount based on the cart items
    private double calculateTotalAmount(Cart cart) {
        double total = 0.0;
        for (CartItem item : cart.getCartItems()) {
            total += item.getProduct().getPrice() * item.getQuantity(); // Assuming Product has a getPrice() method
        }
        return total;
    }





    @Override
    public String getAddressById(Long buyerId) {
      
        return null;
    }

	@Override
	public ProductReview addProductReview(ProductReview productReview) {
		 return productReviewRepo.save(productReview);
	}

	@Override
	public FavoriteProduct addFavoriteProduct(Long buyerId, Long productId) {
		  Buyer buyer = buyerRepository.findById(buyerId).orElseThrow(() -> new IllegalArgumentException("Buyer not found"));
	        Product product = productRepository.findById(productId).orElseThrow(() -> new IllegalArgumentException("Product not found"));

	        FavoriteProduct favoriteProduct = new FavoriteProduct();
	        favoriteProduct.setBuyer(buyer);
	        favoriteProduct.setProduct(product);

	        return favoriteProductRepo.save(favoriteProduct);
	}

	@Override
	public List<FavoriteProduct> getFavoritesByBuyer(Long buyerId) {
		return favoriteProductRepo.findByBuyerBuyerId(buyerId);
	}

}
