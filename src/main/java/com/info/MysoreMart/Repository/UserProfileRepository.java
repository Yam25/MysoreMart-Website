package com.info.MysoreMart.Repository;

import com.info.MysoreMart.Model.Userprofile;
import org.springframework.stereotype.Repository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;
import java.util.Optional;

@Repository
public class UserProfileRepository {

    private SessionFactory sessionFactory;

    public UserProfileRepository() {
        // Initialize the sessionFactory (or inject it via Spring)
        sessionFactory = new Configuration().configure().addAnnotatedClass(Userprofile.class).buildSessionFactory();
    }

    // Save the user to the database
    public void save(Userprofile user) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); 
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Check if email exists
    public boolean existsByEmail(String email) {
        Session session = sessionFactory.openSession();
        Query<Userprofile> query = session.createQuery("FROM Userprofile WHERE email = :email", Userprofile.class);
        query.setParameter("email", email);
        List<Userprofile> result = query.list();
        session.close();
        return !result.isEmpty();
    }

    // Check if phone exists
    public boolean existsByPhone(String phone) {
        Session session = sessionFactory.openSession();
        Query<Userprofile> query = session.createQuery("FROM Userprofile WHERE phone = :phone", Userprofile.class);
        query.setParameter("phone", phone);
        List<Userprofile> result = query.list();
        session.close();
        return !result.isEmpty();
    }
    
    // Check if phone exists
    public boolean existsByFullName(String fullname) {
        Session session = sessionFactory.openSession();
        Query<Userprofile> query = session.createQuery("FROM Userprofile WHERE fullname = :fullname", Userprofile.class);
        query.setParameter("fullname", fullname);
        List<Userprofile> result = query.list();
        session.close();
        return !result.isEmpty();
    }

    // Find user by email
    public Optional<Userprofile> findByEmail(String email) {
        Session session = sessionFactory.openSession();
        Query<Userprofile> query = session.createQuery("FROM Userprofile WHERE email = :email", Userprofile.class);
        query.setParameter("email", email);
        List<Userprofile> result = query.list();
        session.close();
        return result.isEmpty() ? Optional.empty() : Optional.of(result.get(0));
    }

    // Find user by phone
    public Optional<Userprofile> findByPhone(String phone) {
        Session session = sessionFactory.openSession();
        Query<Userprofile> query = session.createQuery("FROM Userprofile WHERE phone = :phone", Userprofile.class);
        query.setParameter("phone", phone);
        List<Userprofile> result = query.list();
        session.close();
        return result.isEmpty() ? Optional.empty() : Optional.of(result.get(0));
    }

	public void updatePassword(Userprofile user) {
		
	      Session session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        try {
	            session.update(user);
	            transaction.commit();
	        } catch (Exception e) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	}
	// Find user by ID
    public Optional<Userprofile> findById(Long userId) {
        Session session = sessionFactory.openSession();
        try {
            Userprofile user = session.get(Userprofile.class, userId); // Fetch user by ID
            return Optional.ofNullable(user); // Wrap the result in Optional
        } finally {
            session.close(); // Ensure the session is closed
        }
    }

	
}
