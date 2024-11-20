package com.info.MysoreMart.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.info.MysoreMart.Model.Categories; 
import com.info.MysoreMart.Model.Product;  
import com.info.MysoreMart.Repository.ProductRepository;

@Service
public class ProductService {

	@Autowired 
	private ProductRepository repo;

	public void saveProduct(Product product) {
		repo.save(product); 
	}

	public void saveCategories(Categories categories) {
		repo.saveCategories(categories);
	}
	
	public List<Product> searchProducts(String productName) {
        System.out.println("Searching for products with name: " + productName);  
        return repo.searchProductsByName(productName);  
    }
	
	public List<Product> getProductsByCategory(String categoryName) {
	    return repo.findProductsByCategory(categoryName);  // This calls the repository method
	}

}

