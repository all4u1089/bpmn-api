package com.qlxdcb.clouvir.model.medial;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.qlxdcb.clouvir.model.BaoCaoKeHoachVon;
import com.qlxdcb.clouvir.model.KeHoachNhuCauVon;
import com.qlxdcb.clouvir.model.Model;
import com.qlxdcb.clouvir.model.User;


@Entity
@Table(name = "medial_file")
public class Medial_KeHoachNhuCauVon_Post extends Model<Medial_KeHoachNhuCauVon_Post> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2076763099314788943L;

	public Medial_KeHoachNhuCauVon_Post() {
		this.setId(0l);
	}
	
	@Transient
	private String flowId;
	
	@Transient
	private KeHoachNhuCauVon keHoachNhuCauVon;

	public String getFlowId() {
		return flowId;
	}

	public void setFlowId(String flowId) {
		this.flowId = flowId;
	}

	public KeHoachNhuCauVon getKeHoachNhuCauVon() {
		return keHoachNhuCauVon;
	}

	public void setKeHoachNhuCauVon(KeHoachNhuCauVon keHoachNhuCauVon) {
		this.keHoachNhuCauVon = keHoachNhuCauVon;
	}
}
