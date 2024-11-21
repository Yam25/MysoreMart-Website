

package com.info.MysoreMart.Controller;


import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.info.MysoreMart.Model.CartDetails;
import com.info.MysoreMart.Service.CartService;

@Controller
public class MartController {

	@Autowired
    private CartService cartService;
	
	@GetMapping("/")
	public String home(HttpSession session, Model model) {
	    Long userId = (Long) session.getAttribute("userId");

	    if (userId == null) {
	        return "index";
	    }
	    List<CartDetails> cartItems = cartService.getAllCartItems(userId);
	    int itemCount = 0;
	    for (CartDetails item : cartItems) {
	        itemCount += item.getQuanCount();
	    }
	    model.addAttribute("cartItemCount", itemCount);
	    return "index"; 
	}


    @GetMapping("/login")
    public String login() {
        return "login"; 
    }
    
    @GetMapping("/register")
    public String register() {
        return "register"; 
    }
    
    @GetMapping("/forget")
    public String forgot() {
        return "forget";  
    }
    
    @GetMapping("/checkout")
    public String checkout() {
        return "checkout";  
    } 
    
    @GetMapping("/search")
    public String search(HttpSession session, Model model) {
    	 Long userId = (Long) session.getAttribute("userId");

 	    if (userId == null) {
 	        return "index";
 	    }
 	    List<CartDetails> cartItems = cartService.getAllCartItems(userId);
 	    int itemCount = 0;
 	    for (CartDetails item : cartItems) {
 	        itemCount += item.getQuanCount();
 	    }
 	    model.addAttribute("cartItemCount", itemCount);
        return "search"; 
    }
   
    @GetMapping("/cart")
    public String getCartItems(HttpSession session, Model model) {
        
        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            
            return "redirect:/login";  // Redirect to login if userId is not present
        }
        List<CartDetails> cartItems = cartService.getAllCartItems(userId);
        model.addAttribute("cartItems", cartItems);
        return "cart";  
    }
}
