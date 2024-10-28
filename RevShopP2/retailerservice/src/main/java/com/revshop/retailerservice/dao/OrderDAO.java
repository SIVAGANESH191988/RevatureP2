package com.revshop.retailerservice.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.revshop.retailerservice.entity.Order;

@Repository
public interface OrderDAO extends JpaRepository<Order, Long> {
    
	@Query("SELECT o FROM Order o WHERE o.retailer.id = ?1")
	List<Order> findByRetailerId(Long retailerId);

	@Query("SELECT COUNT(oi) FROM OrderItem oi WHERE oi.order.retailer.id = :retailerId")
	int countByRetailerId(@Param("retailerId") Long retailerId);

	@Query("SELECT o FROM Order o LEFT JOIN FETCH o.orderItems WHERE o.retailer.id = :retailerId")
	List<Order> getOrdersByRetailerId(@Param("retailerId") Long retailerId);

	@Query("SELECT o FROM Order o JOIN o.orderItems oi WHERE oi.orderItemId = :orderItemId")
	Optional<Order> findOrderByOrderItemId(@Param("orderItemId") Long orderItemId);

}