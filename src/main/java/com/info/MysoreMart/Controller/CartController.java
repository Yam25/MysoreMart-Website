package com.info.MysoreMart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
            HttpSession session) {

        // Retrieve the user ID from the session
        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            return ResponseEntity.status(401).body("User not logged in."); 
        }

        // Check if the product already exists in the cart for this user
        CartDetails existingCartItem = cartService.findCartItemByUserIdAndProductName(userId, productName);

        if (existingCartItem != null) {
            // If the item exists, increase the quantity by 1
            existingCartItem.setQuanCount(existingCartItem.getQuanCount() + 1); // Increment quantity by 1

            try {
                
                cartService.updateQuantity(existingCartItem.getId(), userId, existingCartItem.getQuanCount());
                return ResponseEntity.ok("Item quantity updated successfully"); 
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.status(500).body("Error updating item quantity");
            }
        } else {
            // Create a new CartDetails object for a new item
            CartDetails cartDetails = new CartDetails();
            cartDetails.setProductName(productName);
            cartDetails.setPrice(price);
            cartDetails.setSelectedQuantity(selectedQuantity); 
            cartDetails.setImgUrl(imgUrl); 
            cartDetails.setUser(userProfileService.findById(userId)); 
            cartDetails.setQuanCount(1); // Set initial quantity to 1

            try {
                cartService.addCartItem(cartDetails); // Save the new cart item
               
                int currentCount = (Integer) session.getAttribute("cartItemCount");
                session.setAttribute("cartItemCount", currentCount + 1); 
                return ResponseEntity.ok("Item added to cart successfully");
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.status(500).body("Error adding item to cart");
            }
        }
    }

    
    //remove functionality
    @PostMapping("/remove") // Use POST method for removing items
    public ResponseEntity<String> removeProduct(@RequestParam("cartId") long cartId, HttpSession session) {
       
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return ResponseEntity.status(401).body("User not logged in."); 
        }
        boolean deleted = cartService.deleteCartItemById(cartId);
        if (deleted) {
        	
            int currentCount = (Integer) session.getAttribute("cartItemCount");
            session.setAttribute("cartItemCount", Math.max(0, currentCount - 1)); // Decrement by 1, but not below 0
            return ResponseEntity.ok("Item deleted successfully.");
        } else {
            return ResponseEntity.status(404).body("Item not found.");
        }
    }
    
    //increase quantityCount functionality
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
        // Retrieve the user ID from the session
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
