package com.revshop.adminservice.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.revshop.adminservice.entity.Retailer;

public interface RetailerDAO  extends JpaRepository<Retailer, Long> {

}
