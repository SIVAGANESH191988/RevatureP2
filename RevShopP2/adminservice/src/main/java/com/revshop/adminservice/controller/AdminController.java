package com.revshop.adminservice.controller;

import java.util.ArrayList;
import java.util.Collections;
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
import org.yaml.snakeyaml.internal.Logger;

import com.revshop.adminservice.dto.BuyerDTO;
import com.revshop.adminservice.dto.ComplaintsDTO;
import com.revshop.adminservice.dto.OrderItemDTO;
import com.revshop.adminservice.dto.OrdersDTO;
import com.revshop.adminservice.dto.RetailersDTO;
import com.revshop.adminservice.entity.*;
import com.revshop.adminservice.service.AdminServiceInterface;

import io.github.resilience4j.ratelimiter.RequestNotPermitted;
import io.github.resilience4j.ratelimiter.annotation.RateLimiter;

@RestController
@CrossOrigin("http://localhost:8084/")
@RequestMapping("/admin")
public class AdminController {
	
	
	Logger log = Logger.getLogger("admincontroller"); 

	@Autowired
	private AdminServiceInterface adminService;
	


    @PostMapping("/loginAdmin")
    public ResponseEntity<String> loginAdmin(@RequestBody Admin admin) {
//    	log.info("login admin method"); 
        int result = adminService.login(admin);
        if (result > 0) {
            return new ResponseEntity<>("Welcome " + admin.getEmail(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Login Failed", HttpStatus.UNAUTHORIZED);
        }
    }
    
//    @GetMapping("/adminLogin")
//    public String showAdminLogin() {
//        return "admin/adminLogin";  // This should match the name of your JSP file
//    }

    @PostMapping("/logout")
    public ResponseEntity<String> logoutAdmin() {
        return new ResponseEntity<>("Logged out successfully", HttpStatus.OK);
    }

    @GetMapping("/viewBuyers")
    public ResponseEntity<List<BuyerDTO>> viewBuyers() {
        List<Buyer> buyers = adminService.viewAllBuyers();
        
        List<BuyerDTO> buyerDTOs = buyers.stream()
                .map(buyer -> {
                    BuyerDTO buyerDTO = new BuyerDTO();
                    buyerDTO.setBuyerId(buyer.getBuyerId());
                    buyerDTO.setName(buyer.getName());
                    buyerDTO.setEmail(buyer.getEmail());
                    buyerDTO.setPassword(buyer.getPassword()); 
                    buyerDTO.setContactNo(buyer.getContactNo());
                    buyerDTO.setCity(buyer.getCity());
                    buyerDTO.setBlocked(buyer.isBlocked());
                    return buyerDTO;
                })
                .collect(Collectors.toList());
        
        return new ResponseEntity<>(buyerDTOs, HttpStatus.OK);
    }


    @GetMapping("/viewRetailers")
    @RateLimiter(name = "inventory", fallbackMethod = "getMessageFallBack")
    public ResponseEntity<List<RetailersDTO>> viewRetailers() {
        List<Retailer> retailers = adminService.viewAllNewRetailersRequests();
        
        List<RetailersDTO> retailersDTOs = retailers.stream()
                .map(retailer -> {
                    RetailersDTO retailersDTO = new RetailersDTO();
                    retailersDTO.setRetailerId(retailer.getRetailerId());
                    retailersDTO.setBusinessName(retailer.getBusinessName());
                    retailersDTO.setEmail(retailer.getEmail());
                    retailersDTO.setPassword(retailer.getPassword());
                    retailersDTO.setContactNo(retailer.getContactNo());
                    retailersDTO.setApproved(retailer.isApproved());
                    retailersDTO.setBlocked(retailer.isBlocked());
                    return retailersDTO;
                })
                .collect(Collectors.toList());
        
        return new ResponseEntity<>(retailersDTOs, HttpStatus.OK);
    }
    public ResponseEntity<String> getMessageFallBack(RequestNotPermitted exception) {

        //  logger.info("Rate limit has applied, So no further calls are getting accepted");

          return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS)
          .body("Too many requests : No further request will be accepted. Please try after sometime");
      }
    
    @GetMapping("/viewOrders")
    public ResponseEntity<List<OrdersDTO>> viewOrders() {
        // Fetch all orders from the service
        List<Order> orders = adminService.viewAllOrders(); // Assuming this method exists in your service

        // Create a list to hold the DTOs
        List<OrdersDTO> ordersDTOs = new ArrayList<>();

        // Iterate over each order and map to OrdersDTO
        for (Order order : orders) {
            OrdersDTO ordersDTO = new OrdersDTO();
            
            // Set the basic order details
            ordersDTO.setOrderId(order.getOrderId());
            ordersDTO.setOrderStatus(order.getOrderStatus());
            ordersDTO.setShippingAddress(order.getShippingAddress());
            ordersDTO.setBillingAddress(order.getBillingAddress());
            ordersDTO.setTotalAmount(order.getTotalAmount());

            // Assuming Order has a Buyer object with the relevant fields
            if (order.getBuyer() != null) {
                ordersDTO.setBuyerName(order.getBuyer().getName()); // Get buyer's name
                ordersDTO.setBuyerContactNo(order.getBuyer().getContactNo()); // Get buyer's contact number
                // You can add buyer's email if you have a field for it in OrdersDTO
                ordersDTO.setBuyerEmail(order.getBuyer().getEmail()); // Assuming an email field exists in Buyer
            }

            // If you have multiple products in the order, loop through orderItems
            List<OrderItem> orderItems = order.getOrderItems(); // Assuming this method exists
            ordersDTO.setOrderItems(orderItems);

            // You can also populate product details from orderItems if needed
            if (!orderItems.isEmpty()) {
                // Assuming the first order item contains the product info you want to display
                OrderItem firstItem = orderItems.get(0);
                ordersDTO.setProductName(firstItem.getProduct().getProductName());
                ordersDTO.setProductImage(firstItem.getProduct().getImage()); // Assuming ImageUrl is the field in Product
                ordersDTO.setQuantity(firstItem.getQuantity());
            }

            // Add the mapped DTO to the list
            ordersDTOs.add(ordersDTO);
        }

        // Return the list of OrdersDTO
        return new ResponseEntity<>(ordersDTOs, HttpStatus.OK);
    }



    @GetMapping("/viewComplaints")
    public ResponseEntity<List<ComplaintsDTO>> viewComplaints() {
        List<Complaint> complaints = adminService.viewAllComplaints();

        List<ComplaintsDTO> complaintsDTOs = complaints.stream()
                .map(complaint -> {
                    ComplaintsDTO complaintsDTO = new ComplaintsDTO();
                    complaintsDTO.setComplaintId(complaint.getComplaintId());
                    complaintsDTO.setSubject(complaint.getSubject());
                    complaintsDTO.setComplaintText(complaint.getComplaintText());
                    
                    
                    if (complaint.getBuyer() != null) {
                        complaintsDTO.setBuyer(new Buyer()); // Creates a new Buyer object
                        complaintsDTO.getBuyer().setName(complaint.getBuyer().getName());
                    }
                    
                   
                    if (complaint.getRetailer() != null) {
                        complaintsDTO.setRetailer(new Retailer()); // Creates a new Retailer object
                        complaintsDTO.getRetailer().setBusinessName(complaint.getRetailer().getBusinessName());
                    }
                    
                    return complaintsDTO;
                })
                .collect(Collectors.toList());

        return new ResponseEntity<>(complaintsDTOs, HttpStatus.OK);
    }



    @GetMapping("/viewApprovedRetailers")
    public ResponseEntity<List<RetailersDTO>> viewApprovedRetailers() {
        List<Retailer> retailers = adminService.ApprovedRetailers();
        
        List<RetailersDTO> retailersDTOs = retailers.stream()
                
                .map(retailer -> {
                    RetailersDTO retailersDTO = new RetailersDTO();
                    retailersDTO.setRetailerId(retailer.getRetailerId());
                    retailersDTO.setBusinessName(retailer.getBusinessName());
                    retailersDTO.setEmail(retailer.getEmail());
					retailersDTO.setPassword(retailer.getPassword());
                    retailersDTO.setContactNo(retailer.getContactNo());
                    retailersDTO.setApproved(retailer.isApproved()); // Directly using boolean
                    retailersDTO.setBlocked(retailer.isBlocked());
                    return retailersDTO;
                })
                .collect(Collectors.toList());
        
        return new ResponseEntity<>(retailersDTOs, HttpStatus.OK);
    }

    @DeleteMapping("/deleteRetailerRequest/{retailerId}")
    public ResponseEntity<String> deleteRetailerRequest(@PathVariable("retailerId") Long retailerId) {
        int result = adminService.deleteRetailerRequest(retailerId);
        return new ResponseEntity<>(result > 0 ? "Retailer request deleted successfully" : "Failed to delete retailer request", result > 0 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }

    @PostMapping("/approveRetailerRequest/{retailerId}")
    public ResponseEntity<String> approveRetailerRequest(@PathVariable("retailerId") Long retailerId) {
        int result = adminService.approveRetailerRequest(retailerId);
        return new ResponseEntity<>(result > 0 ? "Retailer approved successfully" : "Failed to approve retailer", result > 0 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }

    @PostMapping("/blockRetailer/{retailerId}")
    public ResponseEntity<String> blockRetailer(@PathVariable("retailerId") Long retailerId) {	
        int result = adminService.blockRetailer(retailerId);
        return new ResponseEntity<>(result > 0 ? "Retailer blocked successfully" : "Failed to block retailer", result > 0 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }

    @PostMapping("/unblockRetailer/{retailerId}")
    public ResponseEntity<String> unblockRetailer(@PathVariable("retailerId") Long retailerId) {
        int result = adminService.unblockRetailer(retailerId);
        return new ResponseEntity<>(result > 0 ? "Retailer unblocked successfully" : "Failed to unblock retailer", result > 0 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }

    @PostMapping("/blockBuyer/{buyerId}")
    public ResponseEntity<String> blockBuyer(@PathVariable("buyerId") Long buyerId) {
        int result = adminService.blockBuyer(buyerId);
        return new ResponseEntity<>(result > 0 ? "Buyer blocked successfully" : "Failed to block buyer", result > 0 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }

    @PostMapping("/unblockBuyer/{buyerId}")
    public ResponseEntity<String> unblockBuyer(@PathVariable("buyerId") Long buyerId) {
        int result = adminService.unblockBuyer(buyerId);
        return new ResponseEntity<>(result > 0 ? "Buyer unblocked successfully" : "Failed to unblock buyer", result > 0 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Retailer> getRetailerById(@PathVariable Long id) {
        Retailer retailer = adminService.findById(id);
        return ResponseEntity.ok(retailer);
    }

}
