package rus.store.TenderStore.repository;

import rus.store.TenderStore.domain.User;

public interface UserRepository {
	
	public void addUser(User user);
	
	public User getUserByName(String username);

	public boolean ifUserExist(String username);
}
