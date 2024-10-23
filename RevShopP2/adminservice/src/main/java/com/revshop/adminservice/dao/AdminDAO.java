package com.revshop.adminservice.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.revshop.adminservice.entity.*;

import jakarta.transaction.Transactional;

public interface AdminDAO extends JpaRepository<Admin, Integer> {
	
	 @Query("SELECT a FROM Admin a WHERE a.email = :email AND a.password = :password")
	    Admin findByEmailAndPassword(@Param("email") String email, @Param("password") String password);

	    @Query("SELECT b FROM Buyer b")
	    List<Buyer> findAllBuyers();

	    @Query("SELECT r FROM Retailer r WHERE r.isApproved = false")
	    List<Retailer> findAllNewRetailerRequests();
	    
	    @Query("SELECT o FROM Order o")
	  		List<Order> findAllOrders();

	    @Query("SELECT c FROM Complaint c")
	    List<Complaint> findAllComplaints();

	    @Query("SELECT r FROM Retailer r WHERE r.isApproved = true")
	    List<Retailer> findApprovedRetailers();

	    @Modifying
	    @Transactional
	    @Query("DELETE FROM Buyer b WHERE b.id = :buyerId")
	    void deleteBuyerById(@Param("buyerId") Long buyerId);

	    @Modifying
	    @Transactional
	    @Query("DELETE FROM Retailer r WHERE r.id = :retailerId AND r.isApproved = false")
	    void deleteRetailerRequestById(@Param("retailerId") Long retailerId);

	    @Modifying
	    @Transactional
	    @Query("UPDATE Retailer r SET r.isApproved = true WHERE r.id = :retailerId")
	    void approveRetailerRequestById(@Param("retailerId") Long retailerId);

	    @Modifying
	    @Transactional
	    @Query("UPDATE Retailer r SET r.isBlocked = true WHERE r.id = :retailerId")
	    void blockRetailerById(@Param("retailerId") Long retailerId);

	    @Modifying
	    @Transactional
	    @Query("UPDATE Retailer r SET r.isBlocked = false WHERE r.id = :retailerId")
	    void unblockRetailerById(@Param("retailerId") Long retailerId);

	    @Modifying
	    @Transactional
	    @Query("UPDATE Buyer b SET b.isBlocked = true WHERE b.id = :buyerId")
	    void blockBuyerById(@Param("buyerId") Long buyerId);

	    @Modifying
	    @Transactional
	    @Query("UPDATE Buyer b SET b.isBlocked = false WHERE b.id = :buyerId")
	    void unblockBuyerById(@Param("buyerId") Long buyerId);

	    @Modifying
	    @Transactional
	    @Query("DELETE FROM Retailer r WHERE r.id = :retailerId AND r.isApproved = true")
	    void deleteApprovedRetailerById(@Param("retailerId") Long retailerId);

}
