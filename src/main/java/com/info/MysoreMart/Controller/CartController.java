package com.info.MysoreMart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.info.MysoreMart.Model.CartDetails;
import com.info.MysoreMart.Model.Userprofile; // Import your Userprofile class
import com.info.MysoreMart.Service.CartService;
import com.info.MysoreMart.Service.UserProfileService; // Import the UserProfile service if needed

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private UserProfileService userProfileService;
    
    //add functionality no duplicate values allowed
    @PostMapping("/add") 
    public ResponseEntity<String> insertProduct(
            @RequestParam("productName") String productName,
            @RequestParam("price") double price,
            @RequestParam("selectedQuantity") String selectedQuantity, 
            @RequestParam("img") String imgUrl,
            HttpSession session, Model model) {

        
        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            return ResponseEntity.status(401).body("User not logged in."); 
        }
        
        CartDetails existingCartItem = cartService.findCartItemByUserIdAndProductName(userId, productName);

        if (existingCartItem != null) {
            
            existingCartItem.setQuanCount(existingCartItem.getQuanCount() + 1);

            try {
                cartService.updateQuantity(existingCartItem.getId(), userId, existingCartItem.getQuanCount());
                return ResponseEntity.ok("Item quantity updated successfully"); 
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.status(500).body("Error updating item quantity");
            }
        } else {
            
            CartDetails cartDetails = new CartDetails();
            cartDetails.setProductName(productName);
            cartDetails.setPrice(price);
            cartDetails.setSelectedQuantity(selectedQuantity); 
            cartDetails.setImgUrl(imgUrl); 
            cartDetails.setUser(userProfileService.findById(userId)); 
            cartDetails.setQuanCount(1); 

            try {
                cartService.addCartItem(cartDetails);
               
                List<CartDetails> cartItems = cartService.getAllCartItems(userId);
                model.addAttribute("cartItems", cartItems);
                return ResponseEntity.ok("Item added to cart successfully");
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.status(500).body("Error adding item to cart");
            }
        }
    }

    
    @PostMapping("/remove") 
    public ResponseEntity<String> removeProduct(@RequestParam("cartId") long cartId, HttpSession session) {
       
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return ResponseEntity.status(401).body("User not logged in."); 
        }
        boolean deleted = cartService.deleteCartItemById(cartId);
        if (deleted) {
        	
            
            return ResponseEntity.ok("Item deleted successfully.");
        } else {
            return ResponseEntity.status(404).body("Item not found.");
        }
    }
    
    
    @PostMapping("/increaseQuantity")
    public ResponseEntity<String> increaseQuantity(@RequestParam("cartId") long cartId, 
                                                   @RequestParam("newQuantity") long newQuantity, 
                                                   HttpSession session) {
     
        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            return ResponseEntity.status(401).body("User not logged in."); 
        }

        try {
            cartService.updateQuantity(cartId, userId, newQuantity);
            return ResponseEntity.ok("Quantity updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error updating quantity");
        }
    }
    
    
    @PostMapping("/decreaseQuantity")
    public ResponseEntity<String> decreaseQuantity(@RequestParam("cartId") long cartId, 
                                                   @RequestParam("newQuantity") long newQuantity, 
                                                   HttpSession session) {
        
        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            return ResponseEntity.status(401).body("User not logged in."); 
        }

        try {
           
            cartService.updateQuantity(cartId, userId, newQuantity);
            return ResponseEntity.ok("Quantity updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error updating quantity");
        }
    }
}
/*add functionality duplicate values allowed
@PostMapping("/add") 
public ResponseEntity<String> insertProduct(
        @RequestParam("pname") String productName,
        @RequestParam("price") double price,
        @RequestParam("selectedQuantity") String selectedQuantity,
        @RequestParam("img") String imgUrl,
        HttpSession session) { // Include the HttpSession parameter

    // Retrieve the user ID from the session
    Long userId = (Long) session.getAttribute("userId");

    if (userId == null) {
        return ResponseEntity.status(401).body("User not logged in."); // Handle not logged in case
    }

    // Fetch the Userprofile using the userId if necessary (optional)
    Userprofile user = userProfileService.findById(userId); // You need to implement this method in UserProfileService

    // Create a new CartDetails object
    CartDetails cartDetails = new CartDetails();
    cartDetails.setProductName(productName);
    cartDetails.setPrice(price);
    cartDetails.setSelectedQuantity(selectedQuantity);
    cartDetails.setImgUrl(imgUrl); 
    cartDetails.setUser(user); 
    cartDetails.setQuanCount(1); 

    try {
        cartService.addCartItem(cartDetails); // Assuming this method saves the CartDetails with the user association
     // Update the cart item count in the session
        int currentCount = (Integer) session.getAttribute("cartItemCount");
        session.setAttribute("cartItemCount", currentCount + 1); // Increment by 1
        return ResponseEntity.ok("Item added to cart successfully");
    } catch (Exception e) {
        e.printStackTrace(); 
        return ResponseEntity.status(500).body("Error adding item to cart");
    }
}*/
