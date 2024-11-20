package com.info.MysoreMart.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.info.MysoreMart.Model.Categories;
import com.info.MysoreMart.Model.Product;
import com.info.MysoreMart.Service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

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
	    // Call the service layer to fetch products based on category
	    return productService.getProductsByCategory(categoryName);
	}

}