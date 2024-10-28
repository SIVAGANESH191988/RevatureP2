package com.revshop.revshopClientApp.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.revshop.revshopClientApp.dto.Buyer;
import com.revshop.revshopClientApp.dto.Cart;
import com.revshop.revshopClientApp.dto.CartItem;
import com.revshop.revshopClientApp.dto.Product;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BuyerControllerClientSide {

    @Autowired
    private DiscoveryClient discoveryClient;

    @RequestMapping(value = "/registerBuyer", method = RequestMethod.POST)  // Specify POST method
    public ModelAndView registerBuyer(@RequestParam("name") String name,
                                      @RequestParam("email") String email,
                                      @RequestParam("contactNo") String contactNo,
                                      @RequestParam("password") String password,
                                      @RequestParam("city") String city,
                                      HttpServletRequest request) {

        ModelAndView modelAndView = new ModelAndView();

        Buyer buyer = new Buyer();
        buyer.setName(name);
        buyer.setEmail(email);
        buyer.setContactNo(contactNo);
        buyer.setPassword(password);
        buyer.setCity(city);

        List<ServiceInstance> instances = discoveryClient.getInstances("BUYERSERVICE");

        if (instances.isEmpty()) {
            modelAndView.setViewName("errorPage"); 
            modelAndView.addObject("message", "Buyer service is unavailable.");
            return modelAndView;
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/api/buyers/register";
        System.out.println(baseUrl);
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        HttpEntity<Buyer> entity = new HttpEntity<>(buyer, headers);

        try {
            ResponseEntity<String> result = restTemplate.exchange(baseUrl, HttpMethod.POST, entity, String.class);
            String responseBody = result.getBody();
            System.out.println("Response Body: " + responseBody);

            // Check if the registration is successful
            if (responseBody != null && responseBody.contains("success")) {
            	request.getSession().setAttribute("alertMessage", "Buyer registered successfully");
                modelAndView.setViewName("redirect:/user/authentication.jsp"); 
//                modelAndView.addObject("alertMessage", "Buyer registered successfully");
            } else {
                request.getSession().setAttribute("alertMessage", "Buyer registration failed");
                modelAndView.setViewName("redirect:/user/error.jsp"); 
//                modelAndView.addObject("alertMessage", "Buyer registration failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("alertMessage", "An error occurred during registration");
            modelAndView.setViewName("redirect:/user/error.jsp");
//            modelAndView.addObject("alertMessage", "An error occurred during registration");
        }

        return modelAndView;
    }
    
    
    @RequestMapping("loginBuyer")
    public ModelAndView loginBuyer(@RequestParam("email") String email, 
                                    @RequestParam("password") String password, 
                                    HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        
        Buyer buyer = new Buyer();
        buyer.setEmail(email);
        buyer.setPassword(password);
        
        List<ServiceInstance> instances = discoveryClient.getInstances("BUYERSERVICE");
        
        if (instances.isEmpty()) {
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Buyer service is unavailable.");
            return modelAndView;
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/api/buyers/login";

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        HttpEntity<Buyer> entity = new HttpEntity<>(buyer, headers);
        
        try {
            ResponseEntity<String> response = restTemplate.exchange(baseUrl, HttpMethod.POST, entity, String.class);
            String responseBody = response.getBody();
            
            // Log the response for debugging
            System.out.println("Response Body: " + responseBody); 
            
            // Check response status and login result
            if (response.getStatusCode() == HttpStatus.OK && responseBody != null) {
                // Deserialize the response into a Retailer object
                ObjectMapper objectMapper = new ObjectMapper();
                Buyer loggedInBuyer = objectMapper.readValue(responseBody, Buyer.class);
                
                session.setAttribute("email", loggedInBuyer.getEmail());
                session.setAttribute("buyerId", loggedInBuyer.getBuyerId());
                session.setAttribute("name", loggedInBuyer.getName());
                session.setAttribute("password", loggedInBuyer.getPassword());
                session.setAttribute("contactNo", loggedInBuyer.getContactNo()); 
                session.setAttribute("city", loggedInBuyer.getCity());
                session.setAttribute("loginMessage", "Buyer logged in successfully");
                
                // Fetch all products after successful login
                List<ServiceInstance> productInstances = discoveryClient.getInstances("BUYERSERVICE");
                ServiceInstance productServiceInstance = productInstances.get(0);
                String productBaseUrl = productServiceInstance.getUri().toString() + "/api/buyers/AllProducts";

                ResponseEntity<List<Product>> productResponse = restTemplate.exchange(
                    productBaseUrl,
                    HttpMethod.GET,
                    null,
                    new ParameterizedTypeReference<List<Product>>() {}
                );

                if (productResponse.getStatusCode() == HttpStatus.OK) {
                    List<Product> products = productResponse.getBody();
                    // Store the products in session to access them in the Homepage.jsp
                    session.setAttribute("products", products); // Pass products to the session
                } else {
                    modelAndView.addObject("alertMessage", "Error fetching products after login.");
                }

                // Redirect to Homepage.jsp
                modelAndView.setViewName("redirect:/user/Homepage.jsp"); 
            } else {
            	request.getSession().setAttribute("alertMessage", "Buyer login failed");
                modelAndView.setViewName("redirect: /user/authentication.jsp"); 
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("alertMessage", "Invalid Credentails");
            modelAndView.setViewName("redirect:/user/authentication.jsp");

        }
        return modelAndView;
    }
    
	@RequestMapping("buyer/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false); // Get the current session, if it exists
		if (session != null) {
			session.invalidate(); // Invalidate the session
		}
		return "redirect:/user/authentication.jsp"; // Redirect to the main page or a logout confirmation page
	}
    
    
    @RequestMapping("/productDetails")
    public ModelAndView getProductById(@RequestParam("productId") Long productId, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("redirect:/user/ProductDetails.jsp");
        HttpSession session = request.getSession();

        // Fetch buyer service instances
        List<ServiceInstance> instances = discoveryClient.getInstances("BUYERSERVICE");

        if (instances.isEmpty()) {
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Buyer service is unavailable.");
            return modelAndView;
        }

        // Build the URL for the product endpoint
        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/api/buyers/product/" + productId;
System.out.println(baseUrl);
        RestTemplate restTemplate = new RestTemplate();

        try {
            // Fetch product details from the product service
            ResponseEntity<Product> response = restTemplate.exchange(baseUrl, HttpMethod.GET, null, Product.class);
            Product product = response.getBody();

            if (response.getStatusCode() == HttpStatus.OK && product != null) {
                session.setAttribute("product", product);
                // Store the product details in session
            } else {
                session.setAttribute("errorMessage", "Product not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "An error occurred while fetching product details.");
        }

        return modelAndView;
    }
    
    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    public ModelAndView addToCart(@RequestParam("productId") Long productId,
                                  @RequestParam("quantity") int quantity,
                                  HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("redirect:/user/cart.jsp");
        HttpSession session = request.getSession();
        Long buyerId = (Long) session.getAttribute("buyerId");  // Fetch buyer ID from session

        if (buyerId == null) {
            session.setAttribute("alertMessage", "Please log in to add items to the cart.");
            modelAndView.setViewName("redirect:/user/authentication.jsp");
            return modelAndView;
        }

        // Fetch buyer service instances
        List<ServiceInstance> instances = discoveryClient.getInstances("BUYERSERVICE");

        if (instances.isEmpty()) {
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Buyer service is unavailable.");
            return modelAndView;
        }

        // Build the URL for the add-to-cart endpoint
        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/api/buyers/add-to-cart?productId=" + productId + "&quantity=" + quantity + "&buyerId=" + buyerId;
        RestTemplate restTemplate = new RestTemplate();

        try {
            ResponseEntity<String> response = restTemplate.exchange(baseUrl, HttpMethod.POST, null, String.class);

            if (response.getStatusCode() == HttpStatus.OK) {
                session.setAttribute("alertMessage", "Item added to cart successfully");

                // Retrieve the existing cart from the session or create a new one
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();  // Create a new cart if it doesn't exist
                    cart.setBuyer(new Buyer());  // Set the buyer information
                    session.setAttribute("cart", cart); // Store the new cart in the session
                }

                // Check if the product is already in the cart
                boolean itemExists = false;
                for (CartItem item : cart.getCartItems()) {
                    if (item.getProduct().getProductId().equals(productId)) {
                        // Update the quantity if the item is already in the cart
                        item.setQuantity(item.getQuantity() + quantity);
                        itemExists = true;
                        break;
                    }
                }

                if (!itemExists) {
                    // If the item doesn't exist, add it as a new CartItem
                    CartItem newItem = new CartItem();
                    Product product = new Product();  // Fetch or create product details
                    product.setProductId(productId);
                    newItem.setProduct(product);
                    newItem.setQuantity(quantity);
                    cart.getCartItems().add(newItem);  // Add the new item to the cart
                }

                // Store the updated cart in the session
                session.setAttribute("cart", cart);
                
                

            } else {
                session.setAttribute("alertMessage", "Failed to add item to cart.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("alertMessage", "An error occurred while adding to cart.");
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "An error occurred while adding the item to the cart.");
        }

        
        return modelAndView;
    }

    
    @RequestMapping("/addToCart")
    public ModelAndView addToCart(@RequestParam("productId") Long productId, 
                                   @RequestParam("quantity") double quantity, 
                                   HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("cart");
        HttpSession session = request.getSession();

        // Get buyerId from the session
        Long buyerId = (Long) session.getAttribute("buyerId");
        if (buyerId == null) {
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Buyer is not logged in.");
            return modelAndView;
        }

        // Fetch buyer service instances
        List<ServiceInstance> instances = discoveryClient.getInstances("BUYERSERVICE");
        if (instances.isEmpty()) {
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Buyer service is unavailable.");
            return modelAndView;
        }

        // Build the URL for the add to cart endpoint
        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/api/buyers/addToCart?buyerId=" + buyerId + "&productId=" + productId + "&quantity=" + quantity;

        RestTemplate restTemplate = new RestTemplate();

        try {
            // Make the POST request to add the item to the cart
            ResponseEntity<Void> response = restTemplate.postForEntity(baseUrl, null, Void.class);
            
            if (response.getStatusCode() == HttpStatus.OK) {
                modelAndView.addObject("message", "Item added to cart successfully.");
            } else {
                modelAndView.addObject("message", "Failed to add item to cart.");
            }
        } catch (HttpClientErrorException e) {
            e.printStackTrace();
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Error adding item to cart.");
        }

        // Fetch the updated cart after adding the item
        return viewCart(request); // Call viewCart method to refresh the cart
    }


    
    @RequestMapping("/viewCart")
    public ModelAndView viewCart(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("cart"); // Ensure this matches your JSP name
        HttpSession session = request.getSession();

        // Get buyerId from the session
        Long buyerId = (Long) session.getAttribute("buyerId");
        if (buyerId == null) {
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Buyer is not logged in.");
            return modelAndView;
        }

        // Fetch buyer service instances
        List<ServiceInstance> instances = discoveryClient.getInstances("BUYERSERVICE");
        if (instances.isEmpty()) {
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Buyer service is unavailable.");
            return modelAndView;
        }

        // Build the URL for the cart endpoint
        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/api/buyers/cart?buyerId=" + buyerId;

        RestTemplate restTemplate = new RestTemplate();

        try {
            ResponseEntity<List<CartItem>> response = restTemplate.exchange(baseUrl, HttpMethod.GET, null, new ParameterizedTypeReference<List<CartItem>>() {});
            List<CartItem> cartItems = response.getBody();

            if (response.getStatusCode() == HttpStatus.OK && cartItems != null) {
                modelAndView.addObject("cartItems", cartItems); // Add cart items to the model
            } else {
                modelAndView.addObject("message", "No items in the cart.");
            }
        } catch (HttpClientErrorException e) {
            e.printStackTrace();
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Error fetching cart items.");
        }

        return modelAndView;
    }



	@GetMapping("/fetchCartItems")
    public ModelAndView fetchCartItems(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("redirect:/user/cart.jsp"); // Ensure this matches your JSP name
        HttpSession session = request.getSession();

        // Retrieve buyerId from the session
        Long buyerId = (Long) session.getAttribute("buyerId");

        if (buyerId == null) {
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Buyer is not logged in.");
            return modelAndView;
        }

        // Fetch cart items from the buyer service
        List<ServiceInstance> instances = discoveryClient.getInstances("BUYERSERVICE");
        if (instances.isEmpty()) {
            modelAndView.setViewName("errorPage");
            modelAndView.addObject("message", "Buyer service is unavailable.");
            return modelAndView;
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/api/buyers/cart?buyerId=" + buyerId;
        System.out.println(baseUrl);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<List<CartItem>> response;
        
        try {
            response = restTemplate.exchange(baseUrl, HttpMethod.GET, null, new ParameterizedTypeReference<List<CartItem>>() {});
            List<CartItem> cartItems = response.getBody();
            modelAndView.addObject("cartItems", cartItems); // Add cart items to the model
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.addObject("message", "Error fetching cart items.");
        }

        return modelAndView;
    }

    
    
    
}