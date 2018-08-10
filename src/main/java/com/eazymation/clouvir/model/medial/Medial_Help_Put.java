package com.eazymation.clouvir.model.medial;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Transient;
import com.eazymation.clouvir.model.Help;
import com.eazymation.clouvir.model.Model;

public class Medial_Help_Put extends Model<Medial_Help_Put> {
	private static final long serialVersionUID = -2076763099314788943L;

	public Medial_Help_Put() {
		this.setId(0l);
	}
	@Transient
	private Help help;	

	public Help getHelp() {
		return help;
	}

	public void setHelp(Help help) {
		this.help = help;
	}
}