package com.revshop.buyerservice.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.revshop.buyerservice.dto.CartItemDTO;
import com.revshop.buyerservice.dto.ProductDTO;
import com.revshop.buyerservice.dto.ProductReviewDto;
import com.revshop.buyerservice.entity.Buyer;
import com.revshop.buyerservice.entity.Cart;
import com.revshop.buyerservice.entity.CartItem;
import com.revshop.buyerservice.entity.FavoriteProduct;
import com.revshop.buyerservice.entity.Order;
import com.revshop.buyerservice.entity.Product;
import com.revshop.buyerservice.entity.ProductReview;
import com.revshop.buyerservice.service.BuyerService;

import jakarta.transaction.Transactional;

@RestController
@CrossOrigin("http://localhost:8084/")
@RequestMapping("/api/buyers")
@Transactional
public class BuyerController {

    @Autowired
    private BuyerService buyerService;
	
    @PostMapping("/register")
    public ResponseEntity<String> registerBuyer(@RequestBody Buyer buyer) {
        int result = buyerService.registerBuyer(buyer);

        if (result == 1) {
            return ResponseEntity.status(HttpStatus.CREATED).body("Buyer registered successfully.");
        } else {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Email already exists.");
        }
    }

    @PostMapping("/login")
    public ResponseEntity<Buyer> loginBuyer(@RequestBody Buyer buyer) {
        try {
            Buyer loggedInBuyer = buyerService.loginBuyer(buyer);
           
            Buyer buyers = new Buyer(); 
            buyers.setBuyerId(loggedInBuyer.getBuyerId()); 
            buyers.setName(loggedInBuyer.getName());
            buyers.setEmail(loggedInBuyer.getEmail());
            buyers.setPassword(loggedInBuyer.getPassword()); 
            buyers.setContactNo(loggedInBuyer.getContactNo());
            buyers.setCity(loggedInBuyer.getCity()); 
            
            
            return ResponseEntity.ok(buyers);
        } catch (RuntimeException e) {
        	
        	return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null); 
        }
    }
    
    
    @GetMapping("/AllProducts")
    public ResponseEntity<List<ProductDTO>> buyerHomepage() {
        List<Product> products = buyerService.getAllProducts();

        if (products.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        List<ProductDTO> response = new ArrayList<>();

        for (Product product : products) {
            ProductDTO simplifiedProduct = new ProductDTO();
            simplifiedProduct.setProductId(product.getProductId());
            simplifiedProduct.setImage(product.getImage());
            simplifiedProduct.setProductName(product.getProductName());
            simplifiedProduct.setDescription(product.getDescription());
            simplifiedProduct.setPrice(product.getPrice());

            // Convert ProductReview to ProductReviewDTO
            List<ProductReviewDto> reviewDTOs = new ArrayList<>();
            for (ProductReview review : product.getReviews()) {
                ProductReviewDto reviewDTO = new ProductReviewDto();
                reviewDTO.setReviewId(review.getReviewId()); // Adjust as per your review class
                reviewDTO.setReviewText(review.getReviewText()); // Adjust as needed
                reviewDTO.setRating(review.getRating());
                reviewDTO.setBuyerName(review.getBuyer().getName()); 

                reviewDTOs.add(reviewDTO);
            }
            simplifiedProduct.setReviews(reviewDTOs);

            response.add(simplifiedProduct);
        }

        return new ResponseEntity<>(response, HttpStatus.OK);
    }


    @GetMapping("/product/{productId}")
    public ResponseEntity<ProductDTO> getProductById(@PathVariable Long productId) {
        Product product = buyerService.getProductById(productId);

        if (product == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        // Convert Product entity to ProductDTO
        ProductDTO productDTO = new ProductDTO();
        productDTO.setProductId(product.getProductId());
        productDTO.setImage(product.getImage());
        productDTO.setProductName(product.getProductName());
        productDTO.setDescription(product.getDescription());
        productDTO.setPrice(product.getPrice());

        // Convert reviews to DTO
        List<ProductReviewDto> reviewDTOs = product.getReviews().stream()
            .map(review -> {
                ProductReviewDto reviewDTO = new ProductReviewDto();
                reviewDTO.setReviewId(review.getReviewId());
                reviewDTO.setReviewText(review.getReviewText());
                reviewDTO.setRating(review.getRating());
                reviewDTO.setBuyerName(review.getBuyer().getName());
                return reviewDTO;
            })
            .collect(Collectors.toList());

        productDTO.setReviews(reviewDTOs);

        return new ResponseEntity<>(productDTO, HttpStatus.OK);
    }
        
    @PostMapping("/add-to-cart")
    public ResponseEntity<String> addToCart(@RequestParam("productId") long productId, @RequestParam("quantity") int quantity, @RequestParam("buyerId") Long buyerId) {
        Product product = buyerService.getProductById(productId);
        if (product == null) {
            return new ResponseEntity<>("Product not found", HttpStatus.NOT_FOUND);
        }

        System.out.println("Retrieved product details: " + product); // Print full details

        Cart cart = buyerService.getCartByBuyerId(buyerId);
        if (cart == null) {
            cart = new Cart();
            cart.setBuyer(buyerService.getBuyerById(buyerId));
            cart.setCartItems(new ArrayList<>());
        }

        boolean itemExists = false;
        for (CartItem item : cart.getCartItems()) {
            if (item.getProduct() != null && item.getProduct().getProductId().equals(productId)) {
                item.setQuantity(item.getQuantity() + quantity);
                itemExists = true;
                break;
            }
        }

        if (!itemExists) {
            CartItem cartItem = new CartItem();
            System.out.println("Product before setting: " + product);
         
            
            cartItem.setProduct(product);// Ensure 'product' is not null
            System.out.println("Product set in CartItem: " + cartItem.getProduct()); // Check after setting
            cartItem.setQuantity(quantity);
            cartItem.setCart(cart);
            cart.getCartItems().add(cartItem);
            System.out.println("Added new CartItem with product ID: " + product.getProductId());
        }

        buyerService.addToCart(cart);
        return new ResponseEntity<>("Item added to cart", HttpStatus.OK);
    }

    @GetMapping("/cart")
    public ResponseEntity<List<CartItemDTO>> viewCart(@RequestParam("buyerId") Long buyerId) {
        Cart cart = buyerService.getCartByBuyerId(buyerId);
        
        if (cart == null || cart.getCartItems().isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        
        // Convert CartItems to CartItemDTO
        List<CartItemDTO> cartItemDTOList = cart.getCartItems().stream().map(cartItem -> 
            new CartItemDTO(
                cartItem.getCartItemId(),
                cartItem.getProduct().getProductName(),
                cartItem.getQuantity(),
                cartItem.getProduct().getPrice()
            )
        ).collect(Collectors.toList());

        return new ResponseEntity<>(cartItemDTOList, HttpStatus.OK);
    }


    // Place an order

    @PostMapping("/place-order")
    public ResponseEntity<Order> placeOrder(@RequestParam("buyerId") Long buyerId) {
        Cart cart = buyerService.getCartByBuyerId(buyerId);

        if (cart != null && !cart.getCartItems().isEmpty()) {
            Order order = buyerService.placeOrder(cart); // Call the service method to place the 
            cart.getCartItems().clear();
            buyerService.saveCart(cart); 
            return new ResponseEntity<>(order, HttpStatus.CREATED); // Return the created order with status 201
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST); // Return 400 if the cart is empty or null
    }

    // Remove an item from the cart
    @PostMapping("/remove-from-cart")
    public ResponseEntity<String> removeFromCart(@RequestParam("cartItemId") Long cartItemId, @RequestParam("buyerId") Long buyerId) {
        buyerService.deleteCartItemById(cartItemId);
        return new ResponseEntity<>("Item removed from cart", HttpStatus.OK);
    }

    // Update the quantity of an item in the cart
    @PostMapping("/update-cart")
    public ResponseEntity<String> updateCart(@RequestParam("cartItemId") Long cartItemId, @RequestParam("quantity") int quantity, @RequestParam("buyerId") Long buyerId) {
        Cart cart = buyerService.getCartByBuyerId(buyerId);

        if (cart != null) {
            CartItem itemToUpdate = cart.getCartItems().stream()
                    .filter(item -> item.getCartItemId().equals(cartItemId))
                    .findFirst().orElse(null);

            if (itemToUpdate != null) {
                itemToUpdate.setQuantity(quantity);
                buyerService.saveCart(cart);
                return new ResponseEntity<>("Cart updated", HttpStatus.OK);
            }
        }

        return new ResponseEntity<>("Item not found in cart", HttpStatus.NOT_FOUND);
    }
    @PostMapping("/add-review")
    public ResponseEntity<String> addProductReview(@RequestBody ProductReview productReview ){
    	 ProductReview savedReview = buyerService.addProductReview(productReview);
         if (savedReview != null) {
             return new ResponseEntity<>("Product review added successfully", HttpStatus.CREATED);
         } else {
             return new ResponseEntity<>("Failed to add review", HttpStatus.BAD_REQUEST);
         }
     }
    
    @PostMapping("/addToFavorites")
    public ResponseEntity<FavoriteProduct> addFavoriteProduct(@RequestParam Long buyerId, @RequestParam Long productId) {
        FavoriteProduct favoriteProduct = buyerService.addFavoriteProduct(buyerId, productId);
        return ResponseEntity.ok(favoriteProduct);
    }

    @GetMapping("/buyer/{buyerId}")
    public ResponseEntity<List<FavoriteProduct>> getFavoritesByBuyer(@PathVariable Long buyerId) {
        List<FavoriteProduct> favorites = buyerService.getFavoritesByBuyer(buyerId);
        return ResponseEntity.ok(favorites);
    }
}
