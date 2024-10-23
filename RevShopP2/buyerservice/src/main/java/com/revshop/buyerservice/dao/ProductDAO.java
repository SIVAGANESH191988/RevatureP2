package com.revshop.buyerservice.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.revshop.buyerservice.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Long> {
	
    List<Product> findByProductNameContainingIgnoreCase(String product_name); // Search by product name


}
