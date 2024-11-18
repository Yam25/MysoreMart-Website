

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
    public String home() {
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
  
	@GetMapping("/dairyProducts")
    public String dairyProducts() {
        return "dairyProducts"; 
    }
	
	@GetMapping("/dryFruits")
    public String dryfruits() {
        return "dryFruits"; 
    }
	
	@GetMapping("/vegetable")
    public String veggies() {
        return "vegetable"; 
    }
	
	@GetMapping("/spices")
    public String spices() {
        return "spices"; 
    }
	
	
	@GetMapping("/biscuits")
    public String biscuits() {
        return "biscuits"; 
    }
	
	@GetMapping("/dal-pulses")
    public String dal_pulses() {
        return "dal-pulses"; 
    }
	
    @GetMapping("/fruits")
    public String fruits() {
        return "fruits";  
    }
    
    @GetMapping("/grocery")
    public String grocery() {
        return "grocery";  
    }
   
    @GetMapping("/cart")
    public String getCartItems(HttpSession session, Model model) {
        
        Long userId = (Long) session.getAttribute("userId");

        if (userId == null) {
            
            return "redirect:/login";  // Redirect to login if userId is not present
        }

       
        List<CartDetails> cartItems = cartService.getAllCartItems(userId);
       
        
     
        int itemCount = cartService.getItemCountForUser(userId);
        session.setAttribute("cartItemCount", itemCount); 

        model.addAttribute("cartItems", cartItems);
        return "cart";  
    }
}