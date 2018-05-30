package rus.store.TenderStore.security;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import rus.store.TenderStore.domain.User;
import rus.store.TenderStore.repository.UserRepository;

	@Service
	@Transactional
	public class MyUserDetailsService implements UserDetailsService {
		Logger log = Logger.getLogger(MyUserDetailsService.class.getName());
	    @Autowired
	    private UserRepository userRepository;
	    // 
	    public UserDetails loadUserByUsername(String username)
	      throws UsernameNotFoundException {
	    	
	        if (!userRepository.ifUserExist(username)) {
	        	log.warn(userRepository.ifUserExist(username));
	            throw new UsernameNotFoundException(
	              "No user found with username: "+ username);
	        }
	        
	        User user = userRepository.getUserByName(username);
	        log.warn(user.getName());
	        log.warn(user.getEmail());
	        log.warn(user.getPassword());
	        List<GrantedAuthority> authorities = new ArrayList<>();
	        authorities.add(new SimpleGrantedAuthority("USER"));
	        return  new org.springframework.security.core.userdetails.User
	        		(user.getName(), user.getPassword().toLowerCase(), authorities);
	        
	        
	    }
	}

