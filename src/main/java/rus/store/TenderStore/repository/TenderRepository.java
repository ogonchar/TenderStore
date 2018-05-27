package rus.store.TenderStore.repository;

import java.util.List;
import java.util.Map;

import rus.store.TenderStore.domain.Tender;


public interface TenderRepository {
	
	public void addTender(Tender tender);
	
	public void addTenderByParcer(Tender tender, String owner);
	
	public void updateTender(Tender tender);
	
	public Tender getTenderById(String tenderId);
	
	public void delete (String tenderId);
	
	public Map<String,List<Tender>> getAllTendersByOwner(String owner);
	
	
}
