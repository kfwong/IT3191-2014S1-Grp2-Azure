package it3191.companion.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import it3191.companion.dto.User;
import it3191.companion.util.HibernateUtils;

public class UserDao implements Dao<User> {

	@Override
	public User get(Integer id) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		User user = (User) session.get(User.class, id);
		session.close();

		return user;
	}

	@Override
	public void saveOrUpdate(User user) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(user);
		session.getTransaction().commit();
		session.close();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAll() {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<User> users = session.createQuery("FROM User").list();
		session.close();
		
		return users;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(User.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(User user) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(user);
		session.close();
	}
	
	public boolean isExist(User user){
		boolean isExist = true;
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("FROM User WHERE facebookId = :facebookId OR email = :email");
		query.setParameter("facebookId", user.getFacebookId());
		query.setParameter("email", user.getEmail());
		
		if(query.uniqueResult() == null){
			isExist = false;
		}else{
			isExist = true;
		}
		
		session.close();

		return isExist;
	}
	
	public User getByEmail(String email){
		User user = null;
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("FROM User WHERE email = :email");
		query.setParameter("email", email);
		
		user = (User) query.uniqueResult();
		
		session.close();

		return user;
	}
	public User getByForgetPasswordSessionKey(String sessionKey){
		User user=null;
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM User WHERE forgetPasswordSessionKey = :forgetPasswordSessionKey");
		query.setParameter("forgetPasswordSessionKey", sessionKey);
		
		user = (User) query.uniqueResult();
		session.close();
		return user;
	}	

	public User authenticate(String facebookId){
		User user = null;
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("FROM User WHERE facebookId = :facebookId");
		query.setParameter("facebookId", facebookId);
		
		user = (User) query.uniqueResult();
		
		session.close();

		return user;
	}

	public User authenticate(String email, String passwordSHA1){
		User user = null;
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("FROM User WHERE email = :email AND passwordSHA1 = :passwordSHA1");
		query.setParameter("email", email);
		query.setParameter("passwordSHA1", passwordSHA1);
		
		user = (User) query.uniqueResult();
		
		session.close();
	
		return user;
	}
	
	public User authorizePasswordReset(String answer){
		User user = null;
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("FROM User WHERE answer = :answer");
		query.setParameter("answer", answer);
		user=(User) query.uniqueResult();
		session.close();
		return user;
		
	
}
}