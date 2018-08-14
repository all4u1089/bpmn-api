package com.qlxdcb.clouvir.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Size;


import io.swagger.annotations.ApiModel;

@Entity
@Table(name = "setting")
@ApiModel
public class Setting extends Model<Setting> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7142748453126398118L;

	public Setting() {
		
	}
	
	public Setting(String storageFolder) {
		this.storageFolder = storageFolder;
	}

	@Size(max=255)
	private String storageFolder = "";
	
	private boolean changedFolder;

	public String getStorageFolder() {
		return storageFolder;
	}

	public void setStorageFolder(String storageFolder) {
		this.storageFolder = storageFolder;
	}

	public boolean isChangedFolder() {
		return changedFolder;
	}

	public void setChangedFolder(boolean changedFolder) {
		this.changedFolder = changedFolder;
	}
}
