package com.revshop.retailerservice.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.revshop.retailerservice.entity.Retailer;

@Repository
public interface RetailerDAO extends JpaRepository<Retailer, Long> {
	
	
	Optional<Retailer> findByEmail(String email);

	boolean existsByEmail(String email);
	
	Optional<Retailer> findById(Long retailerId);

	@Query("SELECT r FROM Retailer r WHERE r.retailerId = :retailerId")
    Retailer getRetailerById(Long retailerId);

}


