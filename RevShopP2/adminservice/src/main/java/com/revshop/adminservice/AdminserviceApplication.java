package com.revshop.adminservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.kafka.annotation.KafkaListener;

import com.revshop.adminservice.service.AddProductEvent;

@SpringBootApplication
public class AdminserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(AdminserviceApplication.class, args);
	}
	
	@KafkaListener(topics = "notificationTopic")
    public void handleNotification(AddProductEvent addProductEvent) {
        // Send out an email notification
        System.out.println("Received Notification for Adding new product: "+ addProductEvent.getProductName());
    }

}
