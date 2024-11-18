package com.info.MysoreMart.Model;

import java.util.Objects;

import javax.persistence.*;

@Entity
@Table(name = "cart")
public class CartDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long cid;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "price")
    private double price;

    @Column(name = "quantity")
    private String selectedQuantity;

    @Column(name = "image")
    private String imgUrl;
    
    @Column(name = "quantity_count")
    private long quanCount;
   
  
	@ManyToOne // Change to ManyToOne for multiple items in the cart
    @JoinColumn(name = "user_id", nullable = false) // Ensure the foreign key references Userprofile
    private Userprofile user; // Reference to Userprofile

    public CartDetails() {}

    public CartDetails(long cid, String productName, double price, String selectedQuantity, String imgUrl, Userprofile user,long quanCount) {
        this.cid = cid;
        this.productName = productName;
        this.price = price;
        this.selectedQuantity = selectedQuantity;
        this.imgUrl = imgUrl;
        this.user = user;
        this.quanCount = quanCount;

       
    }

    // Getters and setters...

    public Userprofile getUser() {
        return user; 
    }

    public void setUser(Userprofile user) {
        this.user = user; 
    }
    
    public long getId() {
        return cid;
    }

    public void setId(long cid) {
        this.cid = cid;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getSelectedQuantity() {
        return selectedQuantity;
    }

    public void setSelectedQuantity(String selectedQuantity) {
        this.selectedQuantity = selectedQuantity;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
    
    public long getQuanCount() {
		return quanCount;
	}

	public void setQuanCount(long quanCount) {
		this.quanCount = quanCount;
	}
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartDetails that = (CartDetails) o;
        return cid == that.cid; 
    }

    @Override
    public int hashCode() {
        return Objects.hash(cid);
    }
}
