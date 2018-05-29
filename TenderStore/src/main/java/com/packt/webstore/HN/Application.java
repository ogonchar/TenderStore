package com.packt.webstore.HN;


import org.apache.log4j.Logger;
import org.hibernate.Session;


public class Application {

	public static void main(String[] args) {
		Logger log = Logger.getLogger(Application.class.getName());
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
		log.warn("123");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}
}
