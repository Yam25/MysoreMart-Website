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

 
    public void addCartItem(CartDetails cartDetails) {
        cartRepo.addCartItem(cartDetails);
    }

    
    public List<CartDetails> getAllCartItems(Long userId) {
        return cartRepo.getCartItemsByUserId(userId);
    }

   
    public boolean deleteCartItemById(long id) {
        return cartRepo.deleteCartItem(id); 
    }
   
    public void updateQuantity(long cartId, Long userId, long newQuantity) {
        cartRepo.updateQuantityByCartIdAndUserId(cartId, userId, newQuantity);
    }

	public CartDetails findCartItemByUserIdAndProductName(Long userId, String productName) {
        return cartRepo.findByUserIdAndProductName(userId, productName);
	}
}
