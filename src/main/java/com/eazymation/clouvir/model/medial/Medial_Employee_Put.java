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
public class Medial_Employee_Put extends Model<Medial_Employee_Put> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2076763099314788943L;

	public Medial_Employee_Put() {
		this.setId(0l);
	}
	
	@Transient
	private Long uploadFileCheckListId;
	
	@Transient
	private User employee;
	
	@Transient
	private List<Medial_DocumentFileContract> documentFilesToAdd = new ArrayList<Medial_DocumentFileContract>();
	@Transient
	private List<Medial_DocumentFile> documentFilesToDelete = new ArrayList<Medial_DocumentFile>();
	
	public User getEmployee() {
		return employee;
	}

	public void setEmployee(User employee) {
		this.employee = employee;
	}

	public List<Medial_DocumentFileContract> getDocumentFilesToAdd() {
		return documentFilesToAdd;
	}

	public void setDocumentFilesToAdd(List<Medial_DocumentFileContract> documentFilesToAdd) {
		this.documentFilesToAdd = documentFilesToAdd;
	}

	public List<Medial_DocumentFile> getDocumentFilesToDelete() {
		return documentFilesToDelete;
	}

	public void setDocumentFilesToDelete(List<Medial_DocumentFile> documentFilesToDelete) {
		this.documentFilesToDelete = documentFilesToDelete;
	}

	public Long getUploadFileCheckListId() {
		return uploadFileCheckListId;
	}

	public void setUploadFileCheckListId(Long uploadFileCheckListId) {
		this.uploadFileCheckListId = uploadFileCheckListId;
	}
}
