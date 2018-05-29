package rus.store.TenderStore.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rus.store.TenderStore.domain.Tender;
import rus.store.TenderStore.repository.TenderRepository;
import rus.store.TenderStore.service.TenderService;

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
	
	public Tender getTenderById(String tenderId) {
		return tenderRepository.getTenderById(tenderId);
	}

	
	public void delete (String tenderId) {
		tenderRepository.delete(tenderId);
	}
	
	public Map<String,List<Tender>> getAllTendersByOwner(String owner){
		return tenderRepository.getAllTendersByOwner(owner);
	}
	public List<Tender> getArchivedTenders(String id){
		return tenderRepository.getArchivedTenders(id);
	}
	@Override
	public List<Tender> getContactsTenders(String id) {

		return tenderRepository.getContactsTenders(id);
	}
	
}
