package rus.store.TenderStore.controller;



import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import rus.store.TenderStore.domain.Comment;
import rus.store.TenderStore.domain.Contact;
import rus.store.TenderStore.service.CommentService;
import rus.store.TenderStore.service.ContactService;
import rus.store.TenderStore.service.TenderService;
import rus.store.TenderStore.service.impl.EncoderToUTFImpl;

@Controller
public class ContactController {
	
	Logger log = Logger.getLogger(TenderController.class.getName());
	
	@Autowired
	TenderService tenderService;
	@Autowired
	ContactService contactService;
	@Autowired
	CommentService commentService;
	@Autowired
	EncoderToUTFImpl encoder;

	@RequestMapping(value = "/contact/{idCont}", method = RequestMethod.GET)
	public String listId(Model model, @PathVariable ("idCont") String id) throws UnsupportedEncodingException {
		Comment cmntGet = new Comment();
		Contact cont = contactService.getContactById(id);
		//Create list of comments for encoding to UTF
		List<Comment> cmntPut = (List<Comment>) commentService.getCommentsOfContact(id);
		for (Comment com: cmntPut) com.setText(encoder.encode(com.getText()));
		model.addAttribute("contact", cont);
		model.addAttribute("comment",  cmntGet);
		model.addAttribute("comments", cmntPut);
		model.addAttribute("tenders", tenderService.getContactsTenders(id));
		return "contact";
	}
	@RequestMapping(value = "/contact/{idCont}", method = RequestMethod.POST) 
	public String getComment(@ModelAttribute("comment")Comment cmnt, Model model, @PathVariable ("idCont") String id) {	
		cmnt.setContact(contactService.getContactById(id));
		commentService.addComment(cmnt);
		return "redirect: /TenderStore1/contact/" + id;
	}
	
	@RequestMapping("/contact/delete/{ida}/redir/{idb}")
	public String delete(Model model, @PathVariable ("ida") String id, @PathVariable ("idb") String idb) {
		
		int id1 = Integer.parseInt(id);
		commentService.delete(id1);
		return "redirect: /TenderStore1/contact/"+idb;
	}
}
