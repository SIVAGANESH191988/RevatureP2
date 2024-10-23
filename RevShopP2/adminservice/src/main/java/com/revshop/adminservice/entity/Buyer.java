package com.revshop.adminservice.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;


@Entity
@Table(name="buyer")
public class Buyer {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long buyerId;
	private String name;

	private String email;
	private String password;
	private String contactNo;
	private String city;
	private boolean isBlocked; 
	
	@OneToMany(mappedBy = "buyer", cascade = CascadeType.ALL)
	@JsonIgnore
	private List<Order> orders;

	@OneToOne(mappedBy = "buyer", cascade = CascadeType.ALL)
	private Cart cart;

	@OneToMany(mappedBy = "buyer", cascade = CascadeType.ALL)
	@JsonIgnore
	private List<Complaint> complaints;

	@OneToMany(mappedBy = "buyer", cascade = CascadeType.ALL)
	private List<FavoriteProduct> favoriteProducts;

	@OneToMany(mappedBy = "buyer", cascade = CascadeType.ALL)
	@JsonIgnore
	private List<ProductReview> reviews;

	@OneToMany(mappedBy = "buyer", cascade = CascadeType.ALL)
	private List<Invoice> invoices;

	public Long getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(Long buyerId) {
		this.buyerId = buyerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public boolean isBlocked() {
		return isBlocked;
	}

	public void setBlocked(boolean isBlocked) {
		this.isBlocked = isBlocked;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public List<Complaint> getComplaints() {
		return complaints;
	}

	public void setComplaints(List<Complaint> complaints) {
		this.complaints = complaints;
	}

	public List<FavoriteProduct> getFavoriteProducts() {
		return favoriteProducts;
	}

	public void setFavoriteProducts(List<FavoriteProduct> favoriteProducts) {
		this.favoriteProducts = favoriteProducts;
	}

	public List<ProductReview> getReviews() {
		return reviews;
	}

	public void setReviews(List<ProductReview> reviews) {
		this.reviews = reviews;
	}

	public List<Invoice> getInvoices() {
		return invoices;
	}

	public void setInvoices(List<Invoice> invoices) {
		this.invoices = invoices;
	}
	
	
	
	
	

}
