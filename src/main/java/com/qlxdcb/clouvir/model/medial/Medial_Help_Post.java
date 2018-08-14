package com.qlxdcb.clouvir.model.medial;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.qlxdcb.clouvir.model.Help;
import com.qlxdcb.clouvir.model.Model;

@Entity
@Table(name = "medial_file")
public class Medial_Help_Post extends Model<Medial_Help_Post> {
	
	private static final long serialVersionUID = 8083774806308632942L;
	public Medial_Help_Post() {
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
