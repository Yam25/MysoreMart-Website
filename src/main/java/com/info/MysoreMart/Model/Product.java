package com.info.MysoreMart.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

@Entity
@Component
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties({"category"})  
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long productId;
	private String productName;
	private String productQuantity;
	private String productImage;
	private double productPrice;
	private String productDescription;

	@ManyToOne	  
	@JoinColumn(name = "categoryId") 
	private Categories category;

	public Categories getCategory() { 
		return category; 
	} 
	public void setCategory(Categories category) { 
		this.category = category; 
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}
	public String getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}
	public long getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}
	
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	@Override
	public String toString() {
		return "\n\nProduct Details:\nproductId=" + productId +
				", \nproductName='" + productName + '\'' +
				", \nproductDescription='" + productDescription + '\'' +
				", \nproductQuantity='" + productQuantity + '\'' +
				", \nproductImage='" + productImage + '\'' +
				", \nproductPrice=" + productPrice +
				", \ncategory=" + (category != null ? category.getCategoryName() : "No Category");
	}
}
