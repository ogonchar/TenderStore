package rus.store.TenderStore.repository.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.ConstraintViolationException;

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
			log.warn("Begin transaction...");
			session.getTransaction().begin();
			tender.setIdCompanyRecepient(parser.parseName());
			log.warn("Parser Company : " + tender.getIdCompanyRecepient());
			tender.setCityOfCompany(parser.parseCity());
			log.warn("Parser City : " + tender.getCityOfCompany());
			tender.setTenderStage(parser.parseStage());
			log.warn("Parser Stage : " + tender.getTenderStage());
			tender.setPrice(parser.parsePrice());
			log.warn("Parser Price : " + tender.getPrice());
			tender.setProcuring(parser.parseProcuring());
			log.warn("Parser Procuring : " + tender.getProcuring());
			tender.setSite(parser.parseCite());
			log.warn("Parser Cite : " + tender.getSite());
			tender.setDateTo(parser.parseDateTo());
			log.warn("Parser DateTo : " + tender.getDateTo());
			tender.setDateTender(parser.parseDateTender());
			log.warn("Parser DateTender : " + tender.getDateTender());
			tender.setProcuringContract(parser.parseProcuringContract());
			log.warn("Parser ProcuringContract : " + tender.getProcuringContract());
			tender.setObjectOfPurchase(parser.parsePurchase());
			log.warn("Parser ObjectOfPurchase : " + tender.getObjectOfPurchase());
			tender.setOwner(owner);
			Long l = parser.parseInn();
			tender.setIdInn(l.toString());
		} catch (IOException e1) {
			e1.printStackTrace();
			log.warn("Unable to save the tender due to parse problem");
		} catch (ConstraintViolationException e){
			log.warn("Duplicate exntry, tender do not add");
		}finally{
			session.save(tender);
			session.getTransaction().commit();
			session.close();			
		}
	}
	

	public void updateTender(Tender tender) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();	
		try {
			log.warn("Trying to update tender");
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
	// Method request db for tenders based on their stage. And resume HashMap with three groops: filling, consideration and complited
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
	//Method resume 
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
	
	public List<Tender> getArchivedTenders(String owner){
		Session session = HibernateUtil.getSessionFactory().openSession();
		log.warn("Trying to get archived tenders");
		try {
			session.getTransaction().begin();
			@SuppressWarnings("unchecked")
			List<Tender> tenders = session.createCriteria(Tender.class)
					.add(Restrictions.like("tenderStage", "archived"))
					.add(Restrictions.like("owner", owner))
					.list();
			log.warn("qty of archived tenders : " + tenders.size());
			return tenders;
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

	@Override
	public List<Tender> getContactsTenders(String id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		log.warn("Trying to get contact's tenders");
		try {
			session.getTransaction().begin();
			@SuppressWarnings("unchecked")
			List<Tender> tenders = session.createCriteria(Tender.class)
					.add(Restrictions.not(Restrictions.like("tenderStage", "archived")))
					.add(Restrictions.like("idInn", id))
					.list();
			log.warn("qty of contact's tenders : " + tenders.size());
			return tenders;
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
		return null;
	}
	

}