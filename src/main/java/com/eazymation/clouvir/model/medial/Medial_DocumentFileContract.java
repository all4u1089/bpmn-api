package com.eazymation.clouvir.model.medial;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import com.eazymation.clouvir.enums.FileTypeEnum;
import com.eazymation.clouvir.enums.ObjectTypeEnum;
import com.eazymation.clouvir.model.Model;

public class Medial_DocumentFileContract extends Model<Medial_DocumentFileContract> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8761477861181744362L;

	private String fileName = "";
	private String fileUrl = "";
	
	private float fileSize;
	private Long objectId;
	@Enumerated(EnumType.STRING)
	private ObjectTypeEnum objectType;
	@Enumerated(EnumType.STRING)
	private FileTypeEnum fileType;
	private Long contract_id;
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFileUrl() {
		return fileUrl;
	}
	
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	
	public float getFileSize() {
		return fileSize;
	}
	
	public void setFileSize(float fileSize) {
		this.fileSize = fileSize;
	}
	
	public Long getObjectId() {
		return objectId;
	}
	
	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}
	
	public ObjectTypeEnum getObjectType() {
		return objectType;
	}
	
	public void setObjectType(ObjectTypeEnum objectType) {
		this.objectType = objectType;
	}
	
	public FileTypeEnum getFileType() {
		return fileType;
	}
	
	public void setFileType(FileTypeEnum fileType) {
		this.fileType = fileType;
	}
	
	public Long getContract_id() {
		return contract_id;
	}
	
	public void setContract_id(Long contract_id) {
		this.contract_id = contract_id;
	}
}