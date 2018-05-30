package rus.store.TenderStore.controller;



import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import rus.store.TenderStore.domain.AjaxResponseBody;
import rus.store.TenderStore.domain.Tender;
import rus.store.TenderStore.service.ContactService;
import rus.store.TenderStore.service.TenderService;


	// code for add tenders from main page with form in header
	@RestController
	public class AjaxController {
		@Autowired
		TenderService tenderService;
		@Autowired
		ContactService contactService;;
		Logger log = Logger.getLogger(AjaxController.class.getName());
		
		@JsonView(Views.Public.class)
		@RequestMapping(value = "/addbyparser")
		public AjaxResponseBody adddTenderAjax(@RequestBody String str) {
			
			// Deleting quotes that AJAX create
			str =str.substring(1,str.length()-1);
			
			// Creating response
			AjaxResponseBody result = new AjaxResponseBody();
			
			//Checking if valid tender ID
			if (str.length()<19 ||str.length()>19) {
				result.setMsg("Invalid ID. Please insert correct 19 digits tender ID");
				return result;
			}
			
			// Checking if tender exist
			boolean b = tenderService.isTenderExist(str);
			if (b) {
				result.setMsg("Tender already exist");
				return result;
			}
			
			// Getting user details for adding owner to tender
			UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Tender tnd = new Tender();
			tnd.setIdTenderZakupki(str);
			
			// Adding tender and contact
			log.warn("Trying to add tender");
			tenderService.addTenderByParcer(tnd, authUser.getUsername());
			log.warn("Trying to add contact");
			contactService.addContactByParcer(tnd, authUser.getUsername());	
			
			// Inform AJAX that everything OK
			result.setMsg("OK");
			return result; 
	}
}
