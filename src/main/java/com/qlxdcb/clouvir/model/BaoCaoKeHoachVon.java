package com.qlxdcb.clouvir.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import io.swagger.annotations.ApiModel;


@Entity
@Table(name = "baocaokehoachvon")
@ApiModel
public class BaoCaoKeHoachVon extends Model<BaoCaoKeHoachVon> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6863311021912282591L;
	
	@Size(max=255)
	private String ten = "";

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}
	
	
}