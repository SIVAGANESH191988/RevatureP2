package com.revshop.buyerservice.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.revshop.buyerservice.entity.Cart;
import com.revshop.buyerservice.entity.CartItem;
import com.revshop.buyerservice.entity.Product;

public interface CartItemRepository extends JpaRepository<CartItem, Long>{

	Optional<CartItem> findByCartAndProduct(Cart cart, Product product);

}
