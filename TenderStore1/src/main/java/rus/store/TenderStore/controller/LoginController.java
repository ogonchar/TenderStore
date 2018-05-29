package rus.store.TenderStore.controller;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import rus.store.TenderStore.HN.Application;
import rus.store.TenderStore.domain.User;
import rus.store.TenderStore.repository.UserRepository;

@Controller
public class LoginController {
	
	@Autowired
	UserRepository userService;
	
	Logger log = Logger.getLogger(Application.class.getName());
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String login() {
			return "login";
		}
	  
	@RequestMapping(value ="/registration", method =RequestMethod.GET)
		public String addTendersByParcesGet(Model model) {
			User user = new User();
			model.addAttribute("newUser", user);
			return "registration";
		}
		
	@RequestMapping(value ="/registration", method =RequestMethod.POST)
		public String addTenderByParcesPost (@ModelAttribute("newUser") @Valid User user, BindingResult result) {
			userService.addUser(user);
			return "redirect: login";
		}
	
	//home page
	@RequestMapping("/")
		public String HomePage(Model model) {
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() != "anonymousUser") {
			UserDetails  authUser = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", authUser.getUsername());
		}
		return "index";
		}
}
