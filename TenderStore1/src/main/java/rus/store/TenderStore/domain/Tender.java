package rus.store.TenderStore.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "tenders")
public class Tender implements Serializable{
	
	private static final long serialVersionUID = 1L;
	//The # of tender according to zakupki.gov
	@Id
	@Pattern(regexp="\\d{19}", message="{reg.Product.ID.Validation}")
	@Column(name="ID")
	private String idTenderZakupki;
	@Column(name="IDCOMPANYRECEPIENT")
	private String idCompanyRecepient;
	@Column(name="CITYOFCOMPANY")
	private String cityOfCompany;
	@Column(name="TENDERSTAGE")
	private String tenderStage;
	@Column(name="PRICE")
	private int price;
	@Column(name="PROCURING")
	private int procuring;
	@Column(name="SITE")
	private String site;
	@DateTimeFormat(pattern = "MM-dd-yyyy")
	@Temporal(TemporalType.DATE)
	private Date dateTo;
	@DateTimeFormat(pattern = "MM-dd-yyyy")
	@Temporal(TemporalType.DATE)
	private Date dateTender;
	@Column(name="PROCURINGCONTRACT")
	private int procuringContract;
	@Column(name="OWNER")
	private String owner;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COMPANYIDN", nullable = false)
	private Contact Contact;
	@Column(name="IDINN")
	private String idInn;
	@Column(name="OBJECTOFPURCHASE")
	private String objectOfPurchase;
	
	
	public String getIdTenderZakupki() {
		return idTenderZakupki;
	}
	public void setIdTenderZakupki(String idTenderZakupki) {
		this.idTenderZakupki = idTenderZakupki;
	}
	public String getIdCompanyRecepient() {
		return idCompanyRecepient;
	}
	public void setIdCompanyRecepient(String idCompanyRecepient) {
		this.idCompanyRecepient = idCompanyRecepient;
	}
	public String getCityOfCompany() {
		return cityOfCompany;
	}
	public void setCityOfCompany(String cityOfCompany) {
		this.cityOfCompany = cityOfCompany;
	}
	public String getTenderStage() {
		return tenderStage;
	}
	public void setTenderStage(String tenderStage) {
		this.tenderStage = tenderStage;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getProcuring() {
		return procuring;
	}
	public void setProcuring(int procuring) {
		this.procuring = procuring;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public Date getDateTo() {
		return dateTo;
	}
	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}
	public Date getDateTender() {
		return dateTender;
	}
	public void setDateTender(Date dateTender) {
		this.dateTender = dateTender;
	}
	public int getProcuringContract() {
		return procuringContract;
	}
	public void setProcuringContract(int procuringContract) {
		this.procuringContract = procuringContract;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public Contact getContact() {
		return Contact;
	}
	public void setContact(Contact contact) {
		this.Contact = contact;
	}
	public String getIdInn() {
		return idInn;
	}
	public void setIdInn(String idInn) {
		this.idInn = idInn;
	}
	public String getObjectOfPurchase() {
		return objectOfPurchase;
	}
	public void setObjectOfPurchase(String objectOfPurchase) {
		this.objectOfPurchase = objectOfPurchase;
	}
	
	 
}
