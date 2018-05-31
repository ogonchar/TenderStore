package rus.store.TenderStore.controller;


import java.io.UnsupportedEncodingException;

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
import rus.store.TenderStore.service.CommentService;
import rus.store.TenderStore.service.ContactService;
import rus.store.TenderStore.service.TenderService;
import rus.store.TenderStore.service.impl.EncoderToUTFImpl;
import rus.store.TenderStore.domain.Comment;

	// code for add tenders from main page with form in header
	@RestController
	public class AjaxController {
		@Autowired
		TenderService tenderService;
		@Autowired
		ContactService contactService;
		@Autowired 
		CommentService commentService;
		@Autowired
		EncoderToUTFImpl encoder;
		
		Logger log = Logger.getLogger(AjaxController.class.getName());
		
		
		//Adding tenders from main page
		@JsonView(Views.Public.class)
		@RequestMapping(value = "/addbyparser")
		public AjaxResponseBody addTenderAjax(@RequestBody String str) {
			log.warn("YYYHAAAA");
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
		@JsonView(Views.Public.class)
		@RequestMapping(value = "/editcomment")
		public void editComment(@RequestBody String str) throws UnsupportedEncodingException {
		
			str = encoder.encode(str);
			log.warn(str);
			String text = str.substring(0,str.indexOf(":::"));
			log.warn(text);
			int id = Integer.parseInt(str.substring(str.indexOf(":::")+3));
			log.warn(id);
			// Getting user details for adding owner to tender
			UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Comment cmnt = commentService.getCommentById(id);
			cmnt.setText(text);
			cmnt.setId(id);
			commentService.updateComment(cmnt, authUser.getUsername());
			
			// Adding comment
			log.warn("Trying to add comment");
		}
		
}
