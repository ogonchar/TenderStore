package rus.store.TenderStore.repository;

import rus.store.TenderStore.domain.User;

public interface UserRepository {
	
	public void addUser(User user);
	
	public Boolean ifEmailExist(String email);
	
	public User getUserByEmail(String email);
}
