package com.packt.webstore.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
@Entity
@Table(name = "tenders")
public class Tender implements Serializable{
	@SuppressWarnings("unused")
	private enum stage {filing,consideration, auction, signing, execution, complited }
	
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
	private String price;
	@Column(name="PROCURING")
	private String procuring;
	@Column(name="CITE")
	private String cite;
	@Column(name="DATETO")
	private String dateTo;
	@Column(name="DATETENDER")
	private String dateTender;
	@Column(name="PROCURINGCONTRACT")
	private String procuringContract;
	@Column(name="OWNER")
	private String owner;
	
	
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProcuring() {
		return procuring;
	}
	public void setProcuring(String procuring) {
		this.procuring = procuring;
	}
	public String getCite() {
		return cite;
	}
	public void setCite(String cite) {
		this.cite = cite;
	}
	public String getDateTo() {
		return dateTo;
	}
	public void setDateTo(String dateTo) {
		this.dateTo = dateTo;
	}
	public String getDateTender() {
		return dateTender;
	}
	public void setDateTender(String dateTender) {
		this.dateTender = dateTender;
	}
	public String getProcuringContract() {
		return procuringContract;
	}
	public void setProcuringContract(String procuringContract) {
		this.procuringContract = procuringContract;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	 
}
