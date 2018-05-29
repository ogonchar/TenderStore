package com.packt.webstore.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.packt.webstore.domain.Tender;
import com.packt.webstore.service.TenderService;


@Controller
public class TenderController {

	@Autowired
	TenderService tenderService;

	@RequestMapping("/tenders")
	public String list(Model model) {
		model.addAttribute("tendersfiling", tenderService.getAllTenders("filing"));
		model.addAttribute("tendersconsideration", tenderService.getAllTenders("consideration"));
		model.addAttribute("tenderscomplited", tenderService.getAllTenders("complited"));
		return "tenders";
	}
	@RequestMapping("/tenders/{id}")
	public String listId(Model model, @PathVariable ("id") String id) {
		model.addAttribute("tendersfiling", tenderService.getAllTenders("filing",id));
		model.addAttribute("tendersconsideration", tenderService.getAllTenders("consideration",id));
		model.addAttribute("tenderscomplited", tenderService.getAllTenders("complited",id));
		return "tenders";
	}
	
	@RequestMapping("/tender/{id}")
	public String list(Model model,@PathVariable ("id") String id) {
		model.addAttribute("tender", tenderService.getTenderById(id));
		return "tender";
	}
	
	@RequestMapping(value ="/tenders/add", method =RequestMethod.GET)
	public String addTendersGet(Model model) {
		Tender newTender = new Tender();
		model.addAttribute("newTender", newTender);
		return "addTender";
	}
	@RequestMapping(value ="/tenders/add", method =RequestMethod.POST)
	public String addTenderPost (@ModelAttribute("newTender")Tender newTender) {
		tenderService.addTender(newTender);
		return "redirect: /TenderStore1/tenders";
	}
	
	@RequestMapping(value ="/tenders/addByParcer", method =RequestMethod.GET)
	public String addTendersByParcesGet(Model model) {
		Tender newTender = new Tender();
		model.addAttribute("newTender", newTender);
		return "addByParcer";
	}
	@RequestMapping(value ="/tenders/addByParcer", method =RequestMethod.POST)
	public String addTenderByParcesPost (@ModelAttribute("newTender") @Valid Tender newTender, BindingResult result) {
		UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(result.hasErrors()) {
			   return "addByParcer";
		}
		tenderService.addTenderByParcer(newTender,authUser.getUsername());
		return "redirect: /TenderStore1/tenders/"+ authUser.getUsername();
	}
	@RequestMapping(value="/tenders/updateTender", method=RequestMethod.GET)
	public String updateTenderGet(Model model) {
		Tender newTender = new Tender();
		model.addAttribute("updateTender", newTender);
		return "updateTender";
	}
	@RequestMapping(value="/tenders/updateTender", method=RequestMethod.POST)
	public String updateTenderPost (@RequestParam("id")String productId, @ModelAttribute("updateTender")Tender newTender) {
		System.out.println(productId);
		newTender.setIdTenderZakupki(productId);
		tenderService.updateTender(newTender);
		return "redirect: /store/tenders";
}
	
}
