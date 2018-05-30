package rus.store.TenderStore.HN;


import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import rus.store.TenderStore.domain.Comment;
import rus.store.TenderStore.domain.Contact;


public class Application {

	public static void main(String[] args) {
		Logger log = Logger.getLogger(Application.class.getName());
		
		log.warn(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		Session session = HibernateUtil.getSessionFactory().openSession();
		try{
			Long lng = Long.parseLong("8203000650");
			session.getTransaction().begin();
			List<Comment> list = session.createCriteria(Comment.class).add(Restrictions.like("contact.idInn", lng)).list();
			log.warn(list.get(0).getId());
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}
}
