package rus.store.TenderStore.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "users")
public class User {
	@Id
	@Column(name="NAMEID")
	private String name;
	@Column(name="PASS")
	private String password;
	@Column(name="EMAIL")
	private String email;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<String> getRoles() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
