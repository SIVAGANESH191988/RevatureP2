package com.revshop.adminservice.dto;

import com.revshop.adminservice.entity.Buyer;
import com.revshop.adminservice.entity.Retailer;

public class ComplaintsDTO {
	
	private Long complaintId;
	
	private String subject; 

	private String complaintText;
	
	private Buyer buyer;
	
	private Retailer retailer;

	public Long getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(Long complaintId) {
		this.complaintId = complaintId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getComplaintText() {
		return complaintText;
	}

	public void setComplaintText(String complaintText) {
		this.complaintText = complaintText;
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}

	public Retailer getRetailer() {
		return retailer;
	}

	public void setRetailer(Retailer retailer) {
		this.retailer = retailer;
	}
	
	
	

}
