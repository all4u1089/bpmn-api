package com.qlxdcb.clouvir.model;


import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import com.qlxdcb.clouvir.util.Utils;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;


@Entity
@Table(name = "help")
@ApiModel
public class Help extends Model<Help> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6863311021912282591L;
	
	@Size(max=255)
	private String title = "";
	@Lob
	private String content = "";
	
	public Help() {
		
	}
	
	public Help(String title, String content) {
		this.title = title;
		this.content = content;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	@Transient
	@ApiModelProperty(hidden = true)
	public Map<String, Object> getRelationships() {
		Map<String, Object> map = new HashMap<>();
		// productId
		map.put("helpId", getId());
		return map;
	}
}