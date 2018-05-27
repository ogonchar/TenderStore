package rus.store.TenderStore.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import rus.store.TenderStore.domain.Contact;
import rus.store.TenderStore.domain.Tender;
import rus.store.TenderStore.service.ContactService;
import rus.store.TenderStore.service.TenderService;
import rus.store.TenderStore.service.impl.EncoderToUTFImpl;


@Controller
public class TenderController {

	Logger log = Logger.getLogger(TenderController.class.getName());
	
	@Autowired
	TenderService tenderService;
	@Autowired
	EncoderToUTFImpl encoder;
	@Autowired
	ContactService contactService;	

	
	// Main page with full list of tenders 
	@RequestMapping("/tenders/{id}")
		public String listId(Model model, @PathVariable ("id") String id) {
			Map<String, List<Tender>> map = tenderService.getAllTendersByOwner(id);
			model.addAttribute("tendersfiling", map.get("filing"));
			model.addAttribute("tendersconsideration", map.get("consideration"));
			model.addAttribute("tenderscomplited", map.get("complited"));
			return "tenders";
		}
	
	// View for exact tender with full information
	@RequestMapping("/tender/one/{idtend}")
		public String list(Model model,@PathVariable ("idtend") String id) {
			model.addAttribute("tender", tenderService.getTenderById(id));
			model.addAttribute("user", getUser());
			return "tender";
		}
	
	// Page for addition the ender
	@RequestMapping(value ="/tenders/add", method =RequestMethod.GET)
		public String addTendersGet(Model model) {
			Tender newTender = new Tender();
			model.addAttribute("newTender", newTender);
			return "addTender";
		}
		@RequestMapping(value ="/tenders/add", method =RequestMethod.POST)
			public String addTenderPost (@ModelAttribute("newTender")Tender newTender) throws UnsupportedEncodingException {
				newTender.setIdCompanyRecepient(encoder.encode(newTender.getIdCompanyRecepient()));
				newTender.setCityOfCompany(encoder.encode(newTender.getCityOfCompany()));
				newTender.setOwner(getUser());
				tenderService.addTender(newTender);
				contactService.addContact(new Contact(123456789,newTender.getIdCompanyRecepient(),newTender.getCityOfCompany(), newTender.getOwner()));
				return "redirect: /TenderStore1/tenders/"+getUser();
			}
		
	//Page for updating the the tender
	@RequestMapping(value="/tenders/updateTender", method=RequestMethod.GET)
		public String updateTenderGet(Model model,@RequestParam("id")String tenderId) {
			Tender newTender = tenderService.getTenderById(tenderId);
			model.addAttribute("updateTender", newTender);
			return "updateTender";
		}
		@RequestMapping(value="/tenders/updateTender", method=RequestMethod.POST)
			public String updateTenderPost (@RequestParam("id")String tenderId, @ModelAttribute("updateTender")Tender newTender) throws UnsupportedEncodingException {
				newTender.setIdCompanyRecepient(encoder.encode(newTender.getIdCompanyRecepient()));
				newTender.setCityOfCompany(encoder.encode(newTender.getCityOfCompany()));
				newTender.setIdTenderZakupki(tenderId);
				newTender.setOwner(getUser());
				tenderService.updateTender(newTender);
				return "redirect: /TenderStore1/tenders/"+getUser();
			}
		
	//Deleting tender
	@RequestMapping("/tenders/delete/{id}")
		public String delete(Model model, @PathVariable ("id") String id) {
			tenderService.delete(id);
			return "redirect: /TenderStore1/tenders/"+getUser();
		}
	
	static String getUser() {
		UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return authUser.getUsername();
	}						
}
