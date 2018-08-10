package com.eazymation.clouvir.model.medial;


import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.eazymation.clouvir.model.Model;

@Entity
@Table(name = "medial_file")
public class Medial_Employer_Put extends Model<Medial_Employer_Put> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8083774806308632942L;

	public Medial_Employer_Put() {
		this.setId(0l);
	}
	@Transient
	private Medial_Employer employer;

	public Medial_Employer getEmployer() {
		return employer;
	}
	
	public void setEmployer(Medial_Employer employer) {
		this.employer = employer;
	}
}
	
