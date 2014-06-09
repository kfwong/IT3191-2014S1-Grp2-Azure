package it3191.companion.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import it3191.companion.dto.StudyGroup;
import it3191.companion.util.HibernateUtil;

public class StudyGroupDao implements Dao<StudyGroup> {

	@Override
	public StudyGroup get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		StudyGroup studyGroup = (StudyGroup) session.get(StudyGroup.class, id);
		session.close();

		return studyGroup;
	}

	@Override
	public void saveOrUpdate(StudyGroup t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(t);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<StudyGroup> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<StudyGroup> studyGroup = session.createQuery("FROM StudyGroup").list();
		session.close();
		
		return studyGroup;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(StudyGroup.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(StudyGroup t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(t);
		session.close();
		
	}

}
