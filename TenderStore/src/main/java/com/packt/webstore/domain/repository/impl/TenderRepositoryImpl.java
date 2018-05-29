package com.packt.webstore.domain.repository.impl;

import java.io.IOException;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.packt.webstore.HN.HibernateUtil;
import com.packt.webstore.domain.Tender;
import com.packt.webstore.domain.repository.TenderRepository;
import com.packt.webstore.service.impl.ParserImpl;


@Repository
public class TenderRepositoryImpl implements TenderRepository {

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
		try {
			ParserImpl parser = new ParserImpl(tender.getIdTenderZakupki());
			try {
				session.getTransaction().begin();
				tender.setIdCompanyRecepient(parser.parseName());
				tender.setCityOfCompany(parser.parseCity());
				tender.setTenderStage(parser.parseStage());
				tender.setPrice(parser.parsePrice());
				tender.setProcuring(parser.parseProcuring());
				tender.setCite(parser.parseCite());
				tender.setDateTo(parser.parseDateTo());
				tender.setDateTender(parser.parseDateTender());
				tender.setProcuringContract(parser.parseProcuringContract());
				tender.setOwner(owner);
				session.save(tender);
				session.getTransaction().commit();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();			
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	
	
	public void updateTender(Tender tender) {
		Session session = HibernateUtil.getSessionFactory().openSession();
			
		try {
			session.getTransaction().begin();
			session.update(tender);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
	}	
	
	@SuppressWarnings("unchecked")
	public List<Tender> getAllTenders(String state) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			List<Tender> result = session.createCriteria(Tender.class)
					.add(Restrictions.like("tenderStage", state))
					.list();
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();			
		}
		return null;
	}	
	
	@SuppressWarnings("unchecked")
	public List<Tender> getAllTenders(String state, String owner) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			List<Tender> result = session.createCriteria(Tender.class)
					.add(Restrictions.like("tenderStage", state))
					.add(Restrictions.like("owner", owner))
					.list();
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
	

}