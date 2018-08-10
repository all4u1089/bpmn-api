package com.eazymation.clouvir.model.medial;


public class Medial_UploadFile  {
	
	public Medial_UploadFile() {
		
	}
	
	public Medial_UploadFile(String fileUrl, long fileSize, String fileSizeStr, String fileName) {
		this.fileUrl = fileUrl;
		this.fileSize = fileSize;
		this.fileName = fileName;
		this.fileSizeStr = fileSizeStr;
	}
	
	private String fileUrl = "";
	private long fileSize;
	private String fileSizeStr = "";
	private String fileName = "";
	
	public String getFileUrl() {
		return fileUrl;
	}
	
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	
	public long getFileSize() {
		return fileSize;
	}
	
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileSizeStr() {
		return fileSizeStr;
	}

	public void setFileSizeStr(String fileSizeStr) {
		this.fileSizeStr = fileSizeStr;
	}
}