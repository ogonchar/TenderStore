package rus.store.TenderStore.controller;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

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
		Logger log = Logger.getLogger(TenderController.class.getName());
		
		@JsonView(Views.Public.class)
		@RequestMapping(value = "/addbyparser")
		public String adddTenderAjax(@RequestBody String str) {
			TenderController.getUser();
			Tender tnd = new Tender();
			UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			tnd.setIdTenderZakupki(str.substring(1,str.length()-1));
			log.warn("Trying to add tender");
			tenderService.addTenderByParcer(tnd, authUser.getUsername());
			log.warn("Trying to add contact");
			contactService.addContactByParcer(tnd, authUser.getUsername());	
			return "redirect: /TenderStore1/tenders/" + authUser.getUsername();
	}
}
