package com.qlxdcb.clouvir.model.medial;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.qlxdcb.clouvir.model.Model;
import com.qlxdcb.clouvir.model.User;


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
		
	public User getEmployee() {
		return employee;
	}

	public void setEmployee(User employee) {
		this.employee = employee;
	}

	public Long getUploadFileCheckListId() {
		return uploadFileCheckListId;
	}

	public void setUploadFileCheckListId(Long uploadFileCheckListId) {
		this.uploadFileCheckListId = uploadFileCheckListId;
	}
}
