package com.eazymation.clouvir.util.upload;

public class StorageFileNotFoundException extends StorageException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6515662114965918540L;

	public StorageFileNotFoundException(String message) {
        super(message);
    }

    public StorageFileNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
    
}
