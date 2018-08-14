package com.qlxdcb.clouvir.model.medial;

import java.util.ArrayList;
import java.util.List;

import com.qlxdcb.clouvir.model.Model;

public class Medial_Employee extends Model<Medial_Employee> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8761477861181744362L;

	private String fullName = "";
	private String department = "";
	private String referenceDescription = "";
	private String contact = "";
	private String email = "";
	private String externalIP = "";
	private String internalIP = "";
	private boolean externalIPRequired;
	private Long role_id;
	private Long company_id;
	
	public String getFullName() {
		return fullName;
	}
	
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	public String getDepartment() {
		return department;
	}
	
	public void setDepartment(String department) {
		this.department = department;
	}
	
	public String getReferenceDescription() {
		return referenceDescription;
	}
	
	public void setReferenceDescription(String referenceDescription) {
		this.referenceDescription = referenceDescription;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Long getRole_id() {
		return role_id;
	}
	
	public void setRole_id(Long role_id) {
		this.role_id = role_id;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getExternalIP() {
		return externalIP;
	}

	public void setExternalIP(String externalIP) {
		this.externalIP = externalIP;
	}

	public String getInternalIP() {
		return internalIP;
	}

	public void setInternalIP(String internalIP) {
		this.internalIP = internalIP;
	}

	public boolean isExternalIPRequired() {
		return externalIPRequired;
	}

	public void setExternalIPRequired(boolean externalIPRequired) {
		this.externalIPRequired = externalIPRequired;
	}

	public Long getCompany_id() {
		return company_id;
	}

	public void setCompany_id(Long company_id) {
		this.company_id = company_id;
	}
}