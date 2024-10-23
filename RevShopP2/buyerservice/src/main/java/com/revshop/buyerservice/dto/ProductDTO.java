package com.revshop.buyerservice.dto;

import java.util.List;

public class ProductDTO {
 private long productId;
	
    public long getProductId() {
	return productId;
}
public void setProductId(long productId) {
	this.productId = productId;
}
	private String image;
    private String productName;
    private String description;
    private double price;
    private List<ProductReviewDto> reviews;
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public List<ProductReviewDto> getReviews() {
		return reviews;
	}
	public void setReviews(List<ProductReviewDto> reviews) {
		this.reviews = reviews;
	}

    
    
}
