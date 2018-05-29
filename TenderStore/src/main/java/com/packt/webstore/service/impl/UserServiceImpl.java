package com.packt.webstore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.packt.webstore.domain.User;
import com.packt.webstore.domain.repository.UserRepository;


public class UserServiceImpl {
	
	@Autowired
	private UserRepository userRepository;
	
	public void addUser(User user) {
		userRepository.addUser(user);
	}
	
}
