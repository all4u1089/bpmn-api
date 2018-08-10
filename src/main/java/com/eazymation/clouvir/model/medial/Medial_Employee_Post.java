package com.eazymation.clouvir.model.medial;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.eazymation.clouvir.model.Model;
import com.eazymation.clouvir.model.User;

@Entity
@Table(name = "medial_file")
public class Medial_Employee_Post extends Model<Medial_Employee_Post> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8083774806308632942L;

	public Medial_Employee_Post() {
		this.setId(0l);
	}
	@Transient
	private Long uploadFileCheckListId;
	@Transient
	private Long employeeRegistrationCheckListId;
	@Transient
	private User employee;
	@Transient
	private List<Medial_DocumentFileContract> documentFiles = new ArrayList<Medial_DocumentFileContract>();
	
	public User getEmployee() {
		return employee;
	}

	public void setEmployee(User employee) {
		this.employee = employee;
	}

	public List<Medial_DocumentFileContract> getDocumentFiles() {
		return documentFiles;
	}
	
	public void setDocumentFiles(List<Medial_DocumentFileContract> documentFiles) {
		this.documentFiles = documentFiles;
	}

	public Long getUploadFileCheckListId() {
		return uploadFileCheckListId;
	}

	public void setUploadFileCheckListId(Long uploadFileCheckListId) {
		this.uploadFileCheckListId = uploadFileCheckListId;
	}

	public Long getEmployeeRegistrationCheckListId() {
		return employeeRegistrationCheckListId;
	}

	public void setEmployeeRegistrationCheckListId(Long employeeRegistrationCheckListId) {
		this.employeeRegistrationCheckListId = employeeRegistrationCheckListId;
	}
}

