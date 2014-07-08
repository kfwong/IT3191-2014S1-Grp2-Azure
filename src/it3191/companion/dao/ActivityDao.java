package it3191.companion.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import it3191.companion.dto.Activity;
import it3191.companion.util.HibernateUtils;

public class ActivityDao implements Dao<Activity> {

	@Override
	public Activity get(Integer id) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Activity activity = (Activity) session.get(Activity.class, id);
		session.close();

		return activity;
	}

	@Override
	public void saveOrUpdate(Activity activity) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(activity);
		session.getTransaction().commit();
		session.close();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Activity> getAll() {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Activity> activities = new ArrayList<Activity>(new HashSet<Activity>(session.createCriteria(Activity.class).list()));
		
		session.close();
		
		return activities;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(Activity.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(Activity activity) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(activity);
		session.close();		
	}

}
