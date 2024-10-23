package com.revshop.adminservice.service;

import java.util.List;

import com.revshop.adminservice.entity.*;

public interface AdminServiceInterface {
	
	int login(Admin admin);

	List<Buyer> viewAllBuyers();

	List<Retailer> viewAllNewRetailersRequests();

	List<Complaint> viewAllComplaints();

	List<Retailer> ApprovedRetailers();

	int deleteBuyer(Long buyerId);

	int deleteRetailerRequest(Long retailerId);

	int approveRetailerRequest(Long retailerId);

	int blockRetailer(Long retailerId);

	int unblockRetailer(Long retailerId);

	int blockBuyer(Long buyerId);

	int unblockBuyer(Long buyerId);

	int deleteApprovedRetailer(Long retailerId);

	List<Order> viewAllOrders();
//
	Retailer findById(Long id);

}
