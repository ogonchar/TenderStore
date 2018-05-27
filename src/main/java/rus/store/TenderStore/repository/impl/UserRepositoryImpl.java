package rus.store.TenderStore.repository.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import rus.store.TenderStore.HN.HibernateUtil;
import rus.store.TenderStore.domain.User;
import rus.store.TenderStore.repository.UserRepository;


@Repository
public class UserRepositoryImpl implements UserRepository{
	
	Logger log = Logger.getLogger(UserRepositoryImpl.class.getName());
	
	@Override
	public void addUser(User user) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			session.save(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}	
	
	public Boolean ifEmailExist(String email) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			@SuppressWarnings("unchecked")
			List<User> list = session.createCriteria(User.class)
					.add(Restrictions.like("email", email)).list();
			session.getTransaction().commit();
			return list.size()>0;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
		return true;
	}
	public User getUserByEmail(String email) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			@SuppressWarnings("unchecked")
			List<User> list = session.createCriteria(User.class)
					.add(Restrictions.like("email", email)).list();
			session.getTransaction().commit();
			if (list.size()>0)
			return list.get(0);
			} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
		return null;
	}
}
