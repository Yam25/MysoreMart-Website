package com.info.MysoreMart.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.info.MysoreMart.Model.CartDetails;
import com.info.MysoreMart.Model.Categories;
import com.info.MysoreMart.Model.Product;
import com.info.MysoreMart.Service.CartService;
import com.info.MysoreMart.Service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
    private CartService cartService;

	@PostMapping("/saveProduct")
	public ModelAndView saveProduct(
			@RequestParam("productName") String productName,
			@RequestParam("productDescription") String productDescription,
			@RequestParam("productPrice") double productPrice,
			@RequestParam("productImage") String productImage,
			@RequestParam("productQuantity") String productQuantity,
			@RequestParam("categoryName") String categoryName) {

		Product product = new Product();

		Categories categories = new Categories();

		product.setProductName(productName);      
		product.setProductDescription(productDescription);
		product.setProductQuantity(productQuantity); 
		product.setProductImage(productImage);
		product.setProductPrice(productPrice);    

		categories.setCategoryName(categoryName);

		productService.saveCategories(categories); 

		product.setCategory(categories);

		productService.saveProduct(product);

		ModelAndView view = new ModelAndView();
		RedirectView redirect = new RedirectView();
		redirect.setUrl("/success");  
		view.setView(redirect);

		return view;
	}
	 
	@GetMapping(value = "/searchProducts", produces = "application/json")
	@ResponseBody
	public List<Product> searchProducts(@RequestParam("query") String query) {
	    return productService.searchProducts(query);
	}

	@GetMapping("/getProductsByCategory")
	@ResponseBody
	public List<Product> getProductsByCategory(@RequestParam("categoryName") String categoryName) {
	    
	    return productService.getProductsByCategory(categoryName);
	}
	
	@GetMapping("/{categoryName}")
	public String getproductsByCategory(Model model, @PathVariable String categoryName, HttpSession session) {
		
		 Long userId = (Long) session.getAttribute("userId");
		List<Product> productItems = productService.getProductsByCategory(categoryName);
		System.out.println("Fetched product items: " + productItems);
		model.addAttribute("productItems", productItems);
		
		List<CartDetails> cartItems = cartService.getAllCartItems(userId);
 	    int itemCount = 0;
 	    for (CartDetails item : cartItems) {
 	        itemCount += item.getQuanCount();
 	    }
 	    model.addAttribute("cartItemCount", itemCount); 
		return categoryName;
	}

}