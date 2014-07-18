package it3191.companion.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import it3191.companion.dto.Activity;
import it3191.companion.dto.Comment;
import it3191.companion.util.HibernateUtils;

public class CommentDao implements Dao<Comment> {

	@Override
	public Comment get(Integer id) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Comment comment = (Comment) session.get(Comment.class, id);
		session.close();

		return comment;
	}

	@Override
	public void saveOrUpdate(Comment comment) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(comment);
		session.getTransaction().commit();
		session.close();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getAll() {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Comment> comments = session.createQuery("FROM Comment").list();
		
		session.close();
		
		return comments;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(Comment.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(Comment comment) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(comment);
		session.close();		
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> getAllByActivityId(int activityId){
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Activity activity = new Activity();
		activity.setId(activityId);
		
		Query query = session.createQuery("FROM Comment WHERE activity = :activity");
		query.setParameter("activity", activity);
		
		List<Comment> comments = query.list();
		
		session.close();
		
		return comments;
	}

}
