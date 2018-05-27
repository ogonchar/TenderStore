package rus.store.TenderStore.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rus.store.TenderStore.domain.Contact;
import rus.store.TenderStore.domain.Tender;
import rus.store.TenderStore.repository.ContactRepository;
import rus.store.TenderStore.service.ContactService;
@Service
public class ContactServiceImpl implements ContactService{
	
	
	Logger log = Logger.getLogger(ContactServiceImpl.class.getName());
	@Autowired
	ContactRepository contactRepository;

	public void addContact(Contact contact) {
		contactRepository.addContact(contact);
	}
	
	public void addContactByParcer(Tender tender, String owner) {
		contactRepository.addContactByParcer(tender, owner);
	}
	
	public Contact getContactById(String id) {
		return contactRepository.getContactById(id);
	}
	
	public void delete(String id) {
		contactRepository.delete(id);
	}
	
}
