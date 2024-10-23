package com.revshop.buyerservice.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.revshop.buyerservice.entity.Buyer;

@Repository
public interface BuyerRepository extends JpaRepository<Buyer, Long> {
    Buyer findByEmailAndPassword(String email, String password); // Custom query method for login
    Buyer findByEmail(String email);
	boolean existsByEmail(String email);
	
	
}

