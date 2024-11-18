package com.info.MysoreMart.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.info.MysoreMart.Model.CartDetails;
import com.info.MysoreMart.Repository.CartRepo;

@Service
public class CartService {
    
    @Autowired
    private CartRepo cartRepo;

    // Method to add a cart item
    public void addCartItem(CartDetails cartDetails) {
        cartRepo.addCartItem(cartDetails);
    }

    // Method to fetch all cart items for a specific user
    public List<CartDetails> getAllCartItems(Long userId) {
        return cartRepo.getCartItemsByUserId(userId);
    }

    // Method to delete a cart item by ID
    public boolean deleteCartItemById(long id) {
        return cartRepo.deleteCartItem(id); 
    }
    
 // method to get item count for a user
    public int getItemCountForUser(Long userId) {
        return cartRepo.countByUserId(userId);
    }

    public void updateQuantity(long cartId, Long userId, long newQuantity) {
        cartRepo.updateQuantityByCartIdAndUserId(cartId, userId, newQuantity);
    }

	public CartDetails findCartItemByUserIdAndProductName(Long userId, String productName) {
		 // Call the repository method to find the cart item
        return cartRepo.findByUserIdAndProductName(userId, productName);
	}
}
