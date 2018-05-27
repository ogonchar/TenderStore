package rus.store.TenderStore.domain;


import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CONTACTS")
public class Contact {
	
	
	private long idInn;

	private String name;

	private String fullName;

	private String address;

	private String city;

	private String phone;

	private String email;
	
	private String owner;
	
	private Set<Comment> comments = new HashSet<Comment>(0);
	
	
	
	@Id
	@Column(name="IDINN")
	public long getIdInn() {
		return idInn;
	}
	public void setIdInn(long idInn) {
		this.idInn = idInn;
	}
	@Column(name="NAME")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="FULLNAME")
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	@Column(name="ADDRESS")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name="PHONE")
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Column(name="EMAIL")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name="CITY")
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Contact(int idInn, String fullName, String city, String owner) {
		super();
		this.idInn = idInn;
		this.fullName = fullName;
		this.city = city;
		this.owner = owner;
		
	}
	public Contact() {
		
	}
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "contact")
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	@Column(name="OWNER")
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	
}
