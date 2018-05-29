package com.packt.webstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.packt.webstore.domain.Tender;
import com.packt.webstore.domain.repository.TenderRepository;
import com.packt.webstore.service.TenderService;

@Service
public class TenderServiceImpl implements TenderService{
	
	@Autowired
	TenderRepository tenderRepository;
	
	@Override
	public void addTender(Tender tender) {
		tenderRepository.addTender(tender);
		
	}
	public void addTenderByParcer(Tender tender, String owner) {
		tenderRepository.addTenderByParcer(tender, owner);
	}
	
	@Override
	public void updateTender(Tender tender) {
		tenderRepository.updateTender(tender);
		
	}

	@Override
	public List<Tender> getAllTenders(String state) {
		return tenderRepository.getAllTenders(state);
	}
	
	public Tender getTenderById(String tenderId) {
		return tenderRepository.getTenderById(tenderId);
	}
	
	public List<Tender> getAllTenders(String state, String owner){
		return tenderRepository.getAllTenders(state,owner);
	}

}
