package com.info.MysoreMart.Model;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity
public class Userprofile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // Auto-generated ID by the database

    private String fullName;
    private String email;
    private String phone;
    private String password;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY) // One user can have many cart items
    private List<CartDetails> cartDetails; // List of CartDetails for this user

    public List<CartDetails> getCartDetails() {
        return cartDetails;
    }

    public void setCartDetails(List<CartDetails> cartDetails) {
        this.cartDetails = cartDetails;
    }

    // Getters and setters...
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id; 
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
    
    
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Userprofile that = (Userprofile) o;
        return id != null && id.equals(that.id); // Ensure id is not null
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
