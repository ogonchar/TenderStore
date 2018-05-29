package com.packt.webstore.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String list(Model model) {
	UserDetails  authUser = (UserDetails ) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	model.addAttribute("user", authUser.getUsername());
	return "index";
	}
}
