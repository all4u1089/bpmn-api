package com.eazymation.clouvir.model.medial;

import com.eazymation.clouvir.model.Model;

public class Medial_Employer extends Model<Medial_Employer> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8761477861181744362L;

	private String fullName = "";
	private String department = "";
	private String referenceDescription = "";
	private String contact = "";
	private String email = "";
	private Long role_id;
	
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
}