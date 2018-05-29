package com.packt.webstore.domain.repository.impl;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.packt.webstore.HN.HibernateUtil;
import com.packt.webstore.domain.User;
import com.packt.webstore.domain.repository.UserRepository;


@Repository
public class UserRepositoryImpl implements UserRepository{

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
	
	
}
