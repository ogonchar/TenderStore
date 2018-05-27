package rus.store.TenderStore.repository.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import rus.store.TenderStore.HN.HibernateUtil;
import rus.store.TenderStore.domain.Tender;
import rus.store.TenderStore.repository.TenderRepository;
import rus.store.TenderStore.service.impl.ParserImpl;


@Repository
public class TenderRepositoryImpl implements TenderRepository {
	
	Logger log = Logger.getLogger(TenderRepositoryImpl.class.getName());
	
	public void addTender(Tender tender) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			session.save(tender);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}	
	
	public void addTenderByParcer(Tender tender, String owner) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		log.warn("Hibernate obtain session seccessfully");
		try {
			log.warn("Trying initialize parser");
			ParserImpl parser = new ParserImpl(tender.getIdTenderZakupki());
			try {
				log.warn("Begin transaction...");
				session.getTransaction().begin();
				tender.setIdCompanyRecepient(parser.parseName());
				log.warn("Parser " + tender.getIdCompanyRecepient());
				tender.setCityOfCompany(parser.parseCity());
				log.warn("Parser " + tender.getCityOfCompany());
				tender.setTenderStage(parser.parseStage());
				log.warn("Parser " + tender.getTenderStage());
				tender.setPrice(parser.parsePrice());
				log.warn("Parser " + tender.getPrice());
				tender.setProcuring(parser.parseProcuring());
				log.warn("Parser " + tender.getProcuring());
				tender.setCite(parser.parseCite());
				log.warn("Parser " + tender.getCite());
				tender.setDateTo(parser.parseDateTo());
				log.warn("Parser " + tender.getDateTo());
				tender.setDateTender(parser.parseDateTender());
				log.warn("Parser " + tender.getDateTender());
				tender.setProcuringContract(parser.parseProcuringContract());
				log.warn("Parser " + tender.getProcuringContract());
				tender.setOwner(owner);
				tender.setIdinn(parser.parseInn());
				session.save(tender);
				session.getTransaction().commit();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();			
			}
		} catch (IOException e1) {
			e1.printStackTrace();
			log.warn("Unable to save the tender due to parse problem");
		}
	}
	
	
	

	public void updateTender(Tender tender) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();	
		try {
			
			if(authUser.getUsername().equals(tender.getOwner())) {
			
			session.getTransaction().begin();
			session.update(tender);
			session.getTransaction().commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}	
	
	
	
	
	
	@SuppressWarnings("unchecked")
	public Map<String,List<Tender>> getAllTendersByOwner(String owner){
		Session session = HibernateUtil.getSessionFactory().openSession();
		Map<String,List<Tender>> result = new HashMap<String,List<Tender>>();
		try {
			session.getTransaction().begin();
			result.put("filing", session.createCriteria(Tender.class)
					.add(Restrictions.like("tenderStage", "filing"))
					.add(Restrictions.like("owner", owner))
					.list());
			result.put("consideration", session.createCriteria(Tender.class)
					.add(Restrictions.like("tenderStage", "consideration"))
					.add(Restrictions.like("owner", owner))
					.list());			
			result.put("complited", session.createCriteria(Tender.class)
					.add(Restrictions.like("tenderStage", "complited"))
					.add(Restrictions.like("owner", owner))
					.list());	
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
		return null;
	
	}

	public Tender getTenderById(String tenderId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			return (Tender) session.get(Tender.class, tenderId);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
		return null;
	}
	
	public void delete (String tenderId) {
		UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			
			session.getTransaction().begin();
			Tender tnd = (Tender) session.get(Tender.class, tenderId);
			if (tnd.getOwner().equals(authUser.getUsername())) {
				
			
			tnd.setIdTenderZakupki(tenderId);
			session.delete(tnd);
			session.getTransaction().commit();
			}else {
				throw new Exception();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}
	

}