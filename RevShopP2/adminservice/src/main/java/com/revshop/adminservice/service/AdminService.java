package com.revshop.adminservice.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yaml.snakeyaml.internal.Logger;

import com.revshop.adminservice.dao.AdminDAO;
import com.revshop.adminservice.dao.RetailerDAO;
import com.revshop.adminservice.entity.*;

@Service
public class AdminService implements AdminServiceInterface {
	
	Logger log = Logger.getLogger("adminservice"); 
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private RetailerDAO retailerDAO;
	
	    @Override
	    public int login(Admin admin) {
	        Admin foundAdmin = adminDAO.findByEmailAndPassword(admin.getEmail(), admin.getPassword());
	        return (foundAdmin != null) ? 1 : 0; // Return 1 if login is successful
	    }

	    @Override
	    public List<Buyer> viewAllBuyers() {
	        return adminDAO.findAllBuyers();
	    }

	    @Override
	    public List<Retailer> viewAllNewRetailersRequests() {
	        return adminDAO.findAllNewRetailerRequests();
	    }
	    
	    @Override
		public List<Order> viewAllOrders() {
			return adminDAO.findAllOrders();
		}


	    @Override
	    public List<Complaint> viewAllComplaints() {
	        return adminDAO.findAllComplaints();
	    }

	    @Override
	    public List<Retailer> ApprovedRetailers() {
	        return adminDAO.findApprovedRetailers();
	    }

	    @Override
	    public int deleteBuyer(Long buyerId) {
	        adminDAO.deleteBuyerById(buyerId);
	        return 1; // Assuming success
	    }

	    @Override
	    public int deleteRetailerRequest(Long retailerId) {
	        adminDAO.deleteRetailerRequestById(retailerId);
	        return 1; // Assuming success
	    }

	    @Override
	    public int approveRetailerRequest(Long retailerId) {
	        adminDAO.approveRetailerRequestById(retailerId);
	        return 1; // Assuming success
	    }

	    @Override
	    public int blockRetailer(Long retailerId) {
	        adminDAO.blockRetailerById(retailerId);
	        return 1; // Assuming success
	    }

	    @Override
	    public int unblockRetailer(Long retailerId) {
	        adminDAO.unblockRetailerById(retailerId);
	        return 1; // Assuming success
	    }

	    @Override
	    public int blockBuyer(Long buyerId) {
	        adminDAO.blockBuyerById(buyerId);
	        return 1; // Assuming success
	    }

	    @Override
	    public int unblockBuyer(Long buyerId) {
	        adminDAO.unblockBuyerById(buyerId);
	        return 1; // Assuming success
	    }

	    @Override
	    public int deleteApprovedRetailer(Long retailerId) {
	        adminDAO.deleteApprovedRetailerById(retailerId);
	        return 1; // Assuming success
	    }

		@Override
		public Retailer findById(Long id) {
			 Optional<Retailer> retailerOptional = retailerDAO.findById(id);
			 return retailerOptional.orElse(null);
		}

}
