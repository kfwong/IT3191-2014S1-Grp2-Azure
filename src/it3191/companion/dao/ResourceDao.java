package it3191.companion.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import it3191.companion.dto.Resource;
import it3191.companion.util.HibernateUtils;

public class ResourceDao implements Dao<Resource> {

	@Override
	public Resource get(Integer id) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Resource resource = (Resource) session.get(Resource.class, id);
		session.close();

		return resource;
	}

	@Override
	public void saveOrUpdate(Resource resource) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(resource);
		session.getTransaction().commit();
		session.close();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Resource> getAll() {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Resource> resources = session.createQuery("FROM Resource ORDER BY createdOn").list();
		session.close();
		
		return resources;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(Resource.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(Resource resource) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(resource);
		session.close();		
	}

}
