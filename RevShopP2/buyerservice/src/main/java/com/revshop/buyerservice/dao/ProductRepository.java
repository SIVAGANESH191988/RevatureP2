package com.revshop.buyerservice.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.revshop.buyerservice.entity.Product;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByProductNameContainingIgnoreCase(String product_name); // Search by product name
   
}
