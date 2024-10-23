package com.revshop.buyerservice.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.revshop.buyerservice.entity.Cart;
import com.revshop.buyerservice.entity.Buyer;

public interface CartRepository extends JpaRepository<Cart, Long> {
	
    Cart findByBuyer(Buyer buyer);
}
