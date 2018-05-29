package rus.store.TenderStore.service;

import java.util.List;
import java.util.Map;

import rus.store.TenderStore.domain.Tender;


public interface TenderService {
	
	public void addTender(Tender tender);
	
	public void addTenderByParcer(Tender tender, String owner);
	
	public void updateTender(Tender tender);
	
	public Tender getTenderById(String tenderId);
	
	public void delete (String tenderId);
	
	public Map<String,List<Tender>> getAllTendersByOwner(String owner);

	public List<Tender> getArchivedTenders(String id);

	public List<Tender> getContactsTenders(String id);
}
