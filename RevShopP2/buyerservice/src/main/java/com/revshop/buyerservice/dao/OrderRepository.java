package com.revshop.buyerservice.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revshop.buyerservice.entity.Cart;
import com.revshop.buyerservice.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order,Long>
{


}
