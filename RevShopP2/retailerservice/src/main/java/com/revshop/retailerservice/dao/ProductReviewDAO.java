package com.revshop.retailerservice.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.revshop.retailerservice.entity.ProductReview;

@Repository
public interface ProductReviewDAO  extends JpaRepository<ProductReview, Long> {
    
    @Query("SELECT pr FROM ProductReview pr WHERE pr.retailer.id = ?1")
    List<ProductReview> findByRetailerId(Long retailerId);

    @Query("SELECT pr FROM ProductReview pr WHERE pr.product.productId = ?1")
	List<ProductReview> findByProductId(Long productId);
    
    @Query("SELECT COUNT(pr) FROM ProductReview pr WHERE pr.retailer.id = :retailerId")
    int getTotalProductReviewCountByRetailerId(@Param("retailerId") Long retailerId);
    
}