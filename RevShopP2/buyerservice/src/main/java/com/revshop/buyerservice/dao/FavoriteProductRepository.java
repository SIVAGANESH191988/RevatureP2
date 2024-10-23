package com.revshop.buyerservice.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revshop.buyerservice.entity.Buyer;
import com.revshop.buyerservice.entity.FavoriteProduct;

@Repository
public interface FavoriteProductRepository extends JpaRepository<FavoriteProduct, Long>{


	List<FavoriteProduct> findByBuyer(Buyer b);
	
	List<FavoriteProduct> findByBuyerBuyerId(long b);

}
