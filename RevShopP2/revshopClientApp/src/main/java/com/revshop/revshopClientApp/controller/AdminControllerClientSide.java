package com.revshop.revshopClientApp.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.revshop.revshopClientApp.EmailService.EmailService;
import com.revshop.revshopClientApp.dto.Admin;
import com.revshop.revshopClientApp.dto.Buyer;
import com.revshop.revshopClientApp.dto.Complaint;
import com.revshop.revshopClientApp.dto.Order;
import com.revshop.revshopClientApp.dto.Retailer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminControllerClientSide {

    @Autowired
    private DiscoveryClient discoveryClient;
    
    @Autowired
    private EmailService emailService;

    @RequestMapping("/admin/adminlogin")
    public ModelAndView loginAdmin(HttpServletRequest request,
                                   @RequestParam("email") String email, 
                                   @RequestParam("password") String password) {
        HttpSession session = request.getSession(); // Get session

        Admin admin = new Admin(); // Create an Admin object
        admin.setEmail(email); // Set email from form input
        admin.setPassword(password); // Set password from form input

        // Discover the admin service instance
        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            ModelAndView mv = new ModelAndView();
            mv.addObject("loginResult", "Admin service is unavailable.");
            mv.setViewName("errorPage"); // Error page if no service instances are found
            return mv;
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/loginAdmin";
        System.out.println("Admin service URL: " + baseUrl);

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));

        HttpEntity<Admin> entity = new HttpEntity<>(admin, headers);
        ResponseEntity<String> responseEntity = restTemplate.exchange(baseUrl, HttpMethod.POST, entity, String.class);
        String resultMessage = responseEntity.getBody();
        System.out.println("Response from admin service: " + resultMessage);

        ModelAndView mv = new ModelAndView(); // Creating a model

        if ("Login Failed".equals(resultMessage)) {
            mv.addObject("loginResult", resultMessage);
            mv.setViewName("redirect:/admin/adminLogin");  // Show login page if login failed
        } else {
            session.setAttribute("adminEmail", email); // Set the email in session for future use
            mv.setViewName("redirect:/admin/adminDashboard.jsp");  // Redirect to dashboard on successful login
        }
        return mv; // Returning the model
    }

    @RequestMapping("admin/adminlogout")
    public String logoutAdmin(HttpServletRequest request) { 
        HttpSession session = request.getSession(false); // creating a session
        if (session != null) { 
            session.invalidate(); // invalidating the session
        }
        return "redirect:adminLogin.jsp"; // redirecting to the login page
    }

    @RequestMapping("/viewBuyers")
    public ModelAndView viewBuyers(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Check if session exists
        if (session == null || session.getAttribute("adminEmail") == null) {
            return new ModelAndView("redirect:adminLogin.jsp"); // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }
        
        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/viewBuyers";

        System.out.println("Service URL: " + baseUrl);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Buyer[]> response = restTemplate.getForEntity(baseUrl, Buyer[].class);

        System.out.println("Response Status: " + response.getStatusCode());
        Buyer[] buyers = response.getBody();

        if (buyers != null) {
            System.out.println("Buyers: " + Arrays.toString(buyers)); // Print the array contents
        } else {
            System.out.println("No buyers found or response is null");
        }

        // Store the buyersList in the session
        session.setAttribute("buyersList", Arrays.asList(buyers != null ? buyers : new Buyer[0]));

        // Redirect to the JSP page
        return new ModelAndView("redirect:/admin/Users.jsp");
    }

    
    
    
    @RequestMapping("/viewRetailers")
    public ModelAndView viewRetailers(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Check if session exists
        if (session == null || session.getAttribute("adminEmail") == null) {
            return new ModelAndView("redirect:adminLogin.jsp"); // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }
        
        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/viewRetailers";

        System.out.println("Service URL: " + baseUrl);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Retailer[]> response = restTemplate.getForEntity(baseUrl, Retailer[].class);

        System.out.println("Response Status: " + response.getStatusCode());
        Retailer[] retailers = response.getBody();

        if (retailers != null) {
            System.out.println("Retailers: " + Arrays.toString(retailers)); // Print the array contents
        } else {
            System.out.println("No retailers found or response is null");
        }

        // Store the retailersList in the session
        session.setAttribute("retailersList", Arrays.asList(retailers != null ? retailers : new Retailer[0]));

        // Redirect to the JSP page
        return new ModelAndView("redirect:/admin/Retailers.jsp");
    }

    
    
    @RequestMapping("/viewApprovedRetailers")
    public ModelAndView viewApprovedRetailers(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Check if session exists
        if (session == null || session.getAttribute("adminEmail") == null) {
            return new ModelAndView("redirect:adminLogin.jsp"); // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }
        
        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/viewApprovedRetailers";

        System.out.println("Service URL: " + baseUrl);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Retailer[]> response = restTemplate.getForEntity(baseUrl, Retailer[].class);

        System.out.println("Response Status: " + response.getStatusCode());
        Retailer[] retailers = response.getBody();

        if (retailers != null) {
            System.out.println("Approved Retailers: " + Arrays.toString(retailers)); // Print the array contents
        } else {
            System.out.println("No approved retailers found or response is null");
        }

        // Store the approvedRetailersList in the session
        session.setAttribute("approvedRetailersList", Arrays.asList(retailers != null ? retailers : new Retailer[0]));

        // Redirect to the JSP page
        return new ModelAndView("redirect:/admin/ApprovedRetailers.jsp");
    }

    
    
    @RequestMapping("/viewComplaints")
    public ModelAndView viewComplaints(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Check if session exists
        if (session == null || session.getAttribute("adminEmail") == null) {
            return new ModelAndView("redirect:adminLogin.jsp"); // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }
        
        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/viewComplaints";

        System.out.println("Service URL: " + baseUrl);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Complaint[]> response = restTemplate.getForEntity(baseUrl, Complaint[].class);

        System.out.println("Response Status: " + response.getStatusCode());
        Complaint[] complaints = response.getBody();

        if (complaints != null) {
            System.out.println("Complaints: " + Arrays.toString(complaints)); // Print the array contents
        } else {
            System.out.println("No complaints found or response is null");
        }

        // Store the complaintsList in the session
        session.setAttribute("complaintsList", Arrays.asList(complaints != null ? complaints : new Complaint[0]));

        // Redirect to the JSP page
        return new ModelAndView("redirect:/admin/Complaints.jsp");
    }

    
    
    @RequestMapping("/viewOrders")
    public ModelAndView viewOrders(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Check if session exists
        if (session == null || session.getAttribute("adminEmail") == null) {
            return new ModelAndView("redirect:adminLogin.jsp"); // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/viewOrders";

        System.out.println("Service URL: " + baseUrl);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Order[]> response = restTemplate.getForEntity(baseUrl, Order[].class);

        System.out.println("Response Status: " + response.getStatusCode());
        Order[] ordersDTOs = response.getBody();

        if (ordersDTOs != null) {
            System.out.println("Orders: " + Arrays.toString(ordersDTOs)); // Print the array contents
        } else {
            System.out.println("No orders found or response is null");
        }

        // Store the ordersList in the session
        session.setAttribute("ordersList", Arrays.asList(ordersDTOs != null ? ordersDTOs : new Order[0]));

        // Redirect to the JSP page
        return new ModelAndView("redirect:/admin/Orders.jsp");
    }

    @RequestMapping(value = "/blockBuyer", method = RequestMethod.POST)
    public String blockBuyer(HttpServletRequest request, @RequestParam("buyerId") Long buyerId) {
        HttpSession session = request.getSession(false); // Check if session exists
        if (session == null || session.getAttribute("adminEmail") == null) {
            return "redirect:adminLogin.jsp"; // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/blockBuyer/" + buyerId;

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(baseUrl, HttpMethod.POST, null, String.class);
        String result = response.getBody(); // Get the response body directly

        // Redirect based on the response
        if ("Buyer blocked successfully".equals(result)) {
            // Optionally set a success message in session or flash attributes
            return "redirect:/admin/Users.jsp"; // Redirect to the users list page
        } else {
            // Optionally set an error message in session or flash attributes
            return "redirect:/admin/error.jsp"; // Redirect to an error page
        }
    }

    @RequestMapping(value = "/unblockBuyer", method = RequestMethod.POST)
    public String unblockBuyer(HttpServletRequest request, @RequestParam("buyerId") Long buyerId) {
        HttpSession session = request.getSession(false); // Check if session exists
        if (session == null || session.getAttribute("adminEmail") == null) {
            return "redirect:adminLogin.jsp"; // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/unblockBuyer/" + buyerId;

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(baseUrl, HttpMethod.POST, null, String.class);
        String result = response.getBody(); // Get the response body

        // Redirect based on the response
        if ("Buyer unblocked successfully".equals(result)) {
            // Optionally set a success message in session or flash attributes
            return "redirect:/admin/Users.jsp"; // Redirect to the users list page
        } else {
            // Optionally set an error message in session or flash attributes
            return "redirect:/admin/error.jsp"; // Redirect to an error page
        }
    }
    
    
    @RequestMapping(value = "/blockRetailer", method = RequestMethod.POST)
    public String blockRetailer(HttpServletRequest request, @RequestParam("retailerId") Long retailerId) {
        HttpSession session = request.getSession(false); // Check if session exists
        if (session == null || session.getAttribute("adminEmail") == null) {
            return "redirect:adminLogin.jsp"; // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/blockRetailer/" + retailerId;

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(baseUrl, HttpMethod.POST, null, String.class);
        String result = response.getBody(); // Get the response body directly

        // Redirect based on the response
        if ("Buyer blocked successfully".equals(result)) {
            // Optionally set a success message in session or flash attributes
            return "redirect:/admin/ApprovedRetailers.jsp"; // Redirect to the users list page
        } 
        
        return "redirect:/admin/ApprovedRetailers.jsp";
    }

    @RequestMapping(value = "/unblockRetailer", method = RequestMethod.POST)
    public String unblockRetailer(HttpServletRequest request, @RequestParam("retailerId") Long retailerId) {
        HttpSession session = request.getSession(false); // Check if session exists
        if (session == null || session.getAttribute("adminEmail") == null) {
            return "redirect:adminLogin.jsp"; // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/unblockRetailer/" + retailerId;

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(baseUrl, HttpMethod.POST, null, String.class);
        String result = response.getBody(); // Get the response body

        // Redirect based on the response
        if ("Buyer unblocked successfully".equals(result)) {
            // Optionally set a success message in session or flash attributes
            return "redirect:/admin/ApprovedRetailers.jsp"; // Redirect to the users list page
        }
		return "redirect:/admin/ApprovedRetailers.jsp"; 
    }
    
    
    @RequestMapping(value = "/deleteRetailerRequest", method = RequestMethod.DELETE)
    public ModelAndView deleteRetailerRequest(HttpServletRequest request, @RequestParam("retailerId") Long retailerId) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminEmail") == null) {
            return new ModelAndView("redirect:adminLogin.jsp"); // Redirect if not logged in
        }

        List<ServiceInstance> instances = discoveryClient.getInstances("ADMINSERVICE");
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for ADMINSERVICE");
        }

        ServiceInstance serviceInstance = instances.get(0);
        String baseUrl = serviceInstance.getUri().toString() + "/admin/deleteRetailerRequest/" + retailerId;

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(baseUrl, HttpMethod.DELETE, null, String.class);
        String resultMessage = response.getBody();

        // Add result message to the session to show on the redirected page
        session.setAttribute("deleteResult", resultMessage);

        // Redirect to a page that shows the result
        return new ModelAndView("redirect:/admin/Retailers.jsp");
    }

    @RequestMapping(value = "/approveRetailerRequest", method = RequestMethod.POST)
    public ModelAndView approveRetailerRequest(HttpServletRequest request, @RequestParam("retailerId") Long retailerId) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminEmail") == null) {
            return new ModelAndView("redirect:adminLogin.jsp");
        }

        ServiceInstance serviceInstance = getServiceInstance("ADMINSERVICE");
        String approvalResult = sendApprovalRequest(serviceInstance, retailerId);
        
        session.setAttribute("approveResult", approvalResult);

        Retailer retailer = fetchRetailerDetails(serviceInstance, retailerId);
        if (retailer != null) {
            sendApprovalEmail(retailer);
        } else {
            session.setAttribute("emailError", "Retailer not found for ID: " + retailerId);
        }

        return new ModelAndView("redirect:/admin/Retailers.jsp");
    }

    private ServiceInstance getServiceInstance(String serviceName) {
        List<ServiceInstance> instances = discoveryClient.getInstances(serviceName);
        if (instances.isEmpty()) {
            throw new IllegalStateException("No instances available for " + serviceName);
        }
        return instances.get(0);
    }

    private String sendApprovalRequest(ServiceInstance serviceInstance, Long retailerId) {
        String baseUrl = serviceInstance.getUri().toString() + "/admin/approveRetailerRequest/" + retailerId;
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(baseUrl, HttpMethod.POST, null, String.class);
        return response.getBody();
    }

    private Retailer fetchRetailerDetails(ServiceInstance serviceInstance, Long retailerId) {
        String retailerUrl = serviceInstance.getUri().toString() + "/admin/" + retailerId;
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Retailer> retailerResponse = restTemplate.getForEntity(retailerUrl, Retailer.class);
        return (retailerResponse.getStatusCode() == HttpStatus.OK) ? retailerResponse.getBody() : null;
    }

    private void sendApprovalEmail(Retailer retailer) {
        String subject = "Welcome to REVSHOP!";
        String body = "Dear " + retailer.getBusinessName() + ",\n\n" +
                      "Congratulations! We are excited to you have you on board! \n\n "+
					  "Your login credentials are as follows:\n\n" + "Email: " + retailer.getEmail() + "\nPassword: " + retailer.getPassword() + "\n\n"
                      + "You can now start listing your products on our platform.\n\n" +
                      "Best regards,\nThe Revshop Team";
        emailService.sendSimpleEmail(retailer.getEmail(), subject, body);
    }

    
   
}
