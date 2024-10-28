package com.revshop.retailerservice.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.revshop.retailerservice.entity.Product;

@Repository
public interface ProductDAO extends JpaRepository<Product, Long> {
    
	 @Query("SELECT p FROM Product p WHERE p.retailer.id = ?1")
	    List<Product> findByRetailerId(Long retailerId);

	    @Query("SELECT COUNT(p) FROM Product p WHERE p.retailer.id = ?1")
	    int getTotalProductCount(Long retailerId);
	}