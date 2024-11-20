package com.info.MysoreMart.Repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.info.MysoreMart.Model.Categories;
import com.info.MysoreMart.Model.Product;

@Repository
public class ProductRepository {

	public static Session getSession() { 
		Configuration con = new Configuration().configure().addAnnotatedClass(Product.class).addAnnotatedClass(Categories.class); 
		SessionFactory sf = con.buildSessionFactory();
		Session session = sf.openSession();
		return session; 
	}

	public void save(Product product) { 
		Session session = ProductRepository.getSession();
		Transaction trans = session.beginTransaction();

		session.save(product); 
		trans.commit(); 
		session.close();
		System.out.println("Product Saved Successfully");
	} 

	public void saveCategories(Categories category) {
		Session session = ProductRepository.getSession();
		Transaction trans = session.beginTransaction();

		Categories existingCategory = findCategoryByName(category.getCategoryName(), session);

		if (existingCategory == null) {
			session.save(category);
			System.out.println("New Category Saved Successfully");
		} else {
			category.setCategoryId(existingCategory.getCategoryId()); 
			System.out.println("Category already exists, reused the existing category.");
		}

		trans.commit();
		session.close();
	}

	public Categories findCategoryByName(String categoryName, Session session) {
		String hql = "FROM Categories WHERE categoryName = :categoryName";
		Query query = session.createQuery(hql);
		query.setParameter("categoryName", categoryName);
		return (Categories) query.uniqueResult();
	}

	public List<Product> searchProductsByName(String productName) {
		Session session = ProductRepository.getSession();
		Transaction trans = session.beginTransaction();
		String hql = "FROM Product WHERE LOWER(productName) LIKE :productName";  
		Query<Product> query = session.createQuery(hql, Product.class);
		query.setParameter("productName", "%" + productName.toLowerCase() + "%");  
		List<Product> products = query.list(); 
		System.out.println(products);
		trans.commit();
		session.close();  
		return products;
	}
	
	public List<Product> findProductsByCategory(String categoryName) {
	    Session session = ProductRepository.getSession();
	    Transaction trans = session.beginTransaction();

	    String hql = "FROM Product WHERE category.categoryName = :categoryName";
	    Query<Product> query = session.createQuery(hql, Product.class);
	    query.setParameter("categoryName", categoryName);
	    List<Product> products = query.list();

	    trans.commit();
	    session.close();
	    return products;
	}

}
