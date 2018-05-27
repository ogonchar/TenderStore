package rus.store.TenderStore.service;

import rus.store.TenderStore.domain.Contact;
import rus.store.TenderStore.domain.Tender;

public interface ContactService {
	public void addContact(Contact contact); 
	public void addContactByParcer(Tender tender, String owner);
	public Contact getContactById(String id);
	public void delete(String id);
}
