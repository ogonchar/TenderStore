package rus.store.TenderStore.repository.impl;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import rus.store.TenderStore.HN.HibernateUtil;
import rus.store.TenderStore.domain.Comment;
import rus.store.TenderStore.domain.Tender;
import rus.store.TenderStore.repository.CommentRepository;

@Repository
public class CommentRepositoryImpl implements CommentRepository{
	Logger log = Logger.getLogger(CommentRepositoryImpl.class.getName());
	public void addComment(Comment cmnt) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		ZoneId zonedId = ZoneId.of( "Europe/Moscow" );
		LocalDate today1 = LocalDate.now( zonedId );
		Date date = Date.from(today1.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
		try {
			cmnt.setDate(date);
			session.getTransaction().begin();
			session.save(cmnt);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> getCommentsOfContact(String id){
		Long lng = Long.parseLong(id);
		Session session = HibernateUtil.getSessionFactory().openSession();
		try{
			session.getTransaction().begin();
			return session.createCriteria(Comment.class).add(Restrictions.like("contact.idInn", lng)).list();
			 
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();			
		}
		return null;
		
	}

	@Override
	public void delete(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Comment cmnt = (Comment) session.get(Comment.class, id);
			session.delete(cmnt);
			session.getTransaction().commit();
						
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}
	
	public void updateComment(Comment cmnt, String owner) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();	
		try {
			log.warn("Trying to update comment");
			if(authUser.getUsername().equals(owner)) {
			session.getTransaction().begin();
			session.update(cmnt);
			session.getTransaction().commit();
			}
						
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}

	@Override
	public Comment getCommentById(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			return (Comment) session.get(Comment.class, id);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
		return null;
	}
}
