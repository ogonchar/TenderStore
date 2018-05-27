package rus.store.TenderStore.repository.impl;

import java.io.IOException;

import javax.xml.stream.events.Comment;

import org.apache.log4j.Logger;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import rus.store.TenderStore.HN.HibernateUtil;
import rus.store.TenderStore.domain.Contact;
import rus.store.TenderStore.domain.Tender;
import rus.store.TenderStore.repository.ContactRepository;
import rus.store.TenderStore.service.impl.ParserImpl;


@Repository
public class ContactRepositoryImpl implements ContactRepository{
Logger log = Logger.getLogger(ContactRepositoryImpl.class.getName());
	

		
	public void addContact(Contact contact) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			log.warn("Hibernate trying to save object");
			session.getTransaction().begin();
			session.save(contact);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			log.warn("Hibernate unable to save contact");
		}finally{
			session.close();			
		}
	}
	
	public void addContactByParcer(Tender tender, String owner) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			ParserImpl parser = new ParserImpl(tender.getIdTenderZakupki());
			try {
				session.getTransaction().begin();
				Contact contact = new Contact(); 
				log.warn("Trying to add name");
				contact.setName(parser.parseName());
				log.warn(contact.getName());
				log.warn("Trying to add city");
				contact.setCity(parser.parseCity());
				log.warn(contact.getCity());
				log.warn("Trying to add inn");
				contact.setIdInn(parser.parseInn());
				log.warn(contact.getIdInn());
				log.warn("Trying to add phone");
				contact.setPhone(parser.parsePhone());
				log.warn(contact.getPhone());
				log.warn("Trying to add email");
				contact.setEmail(parser.parseEmail());
				log.warn(contact.getEmail());
				log.warn("Trying to add address");
				contact.setAddress(parser.parseAddress());
				log.warn(contact.getAddress());
				if (contact.getIdInn()!=0) {
					session.save(contact);
				session.getTransaction().commit();
				}else log.warn("Unable to add contact");
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();			
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			log.warn("Problem in parcing in common");
		}
	}
	
	public Contact getContactById(String id) {
		long lng = Long.parseLong(id);
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			return (Contact) session.get(Contact.class, lng);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
		return null;
	}
	
	public void delete(String id) {
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
}
