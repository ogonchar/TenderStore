package com.packt.webstore.service;

import java.util.List;

import com.packt.webstore.domain.Tender;


public interface TenderService {
	
	public void addTender(Tender tender);
	
	public void addTenderByParcer(Tender tender, String owner);
	
	public void updateTender(Tender tender);
	
	public List<Tender> getAllTenders(String state) ;
	
	public List<Tender> getAllTenders(String state, String owner);
	
	public Tender getTenderById(String tenderId);
}
