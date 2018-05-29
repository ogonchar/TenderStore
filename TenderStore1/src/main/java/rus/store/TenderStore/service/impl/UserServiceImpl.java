package rus.store.TenderStore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rus.store.TenderStore.domain.User;
import rus.store.TenderStore.repository.UserRepository;

@Service
public class UserServiceImpl {
	
	@Autowired
	private UserRepository userRepository;
	
	public void addUser(User user) {
		if(!userRepository.ifEmailExist(user.getEmail()))
		userRepository.addUser(user);
	}
	
}
