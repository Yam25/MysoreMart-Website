package com.info.MysoreMart.Repository;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import com.info.MysoreMart.Model.CartDetails;

@Repository
public class CartRepo {
    
    private SessionFactory sessionFactory;

    public CartRepo() {
       
        Configuration cfg = new Configuration().configure().addAnnotatedClass(CartDetails.class);
        this.sessionFactory = cfg.buildSessionFactory();
    }

    /*Method to add a cart item*/
    public void addCartItem(CartDetails cartDetails) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(cartDetails); 
            transaction.commit(); 
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); 
            }
            e.printStackTrace(); 
        }
    }

    /* Method to fetch all cart items for a specific user*/
    public List<CartDetails> getCartItemsByUserId(Long userId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM CartDetails WHERE user.id = :userId", CartDetails.class)
                          .setParameter("userId", userId)
                          .getResultList();
        }
    }

    /*Method to delete a cart item by ID*/
    public boolean deleteCartItem(long id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            CartDetails cartDetails = session.get(CartDetails.class, id);
            if (cartDetails != null) {
                session.delete(cartDetails);
                transaction.commit();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false; 
        }
    }

   /*method to update quantity*/
	public void updateQuantityByCartIdAndUserId(long cartId, Long userId, long newQuantity) {
	    Transaction transaction = null;
	    try (Session session = sessionFactory.openSession()) {
	        transaction = session.beginTransaction();
	        
	        int updatedRows = session.createQuery("UPDATE CartDetails c SET c.quanCount = :newQuantity " +
	                                              "WHERE c.cid = :cartId AND c.user.id = :userId") 
	                                 .setParameter("newQuantity", newQuantity)
	                                 .setParameter("cartId", cartId)
	                                 .setParameter("userId", userId)
	                                 .executeUpdate();
	        
	       
	        if (updatedRows == 0) {
	            throw new Exception("No cart item found for the specified cartId and userId."); 
	        }

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	      
	    }
	}

	/*Method to find a cart item by user ID and product name*/
    public CartDetails findByUserIdAndProductName(Long userId, String productName) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM CartDetails WHERE user.id = :userId AND productName = :productName", CartDetails.class)
                          .setParameter("userId", userId)
                          .setParameter("productName", productName)
                          .uniqueResult(); 
        } catch (Exception e) {
            e.printStackTrace(); 
            return null;
        }
    }

}
