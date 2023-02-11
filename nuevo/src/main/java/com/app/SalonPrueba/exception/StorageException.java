package com.app.SalonPrueba.exception;

public class StorageException extends RuntimeException {

	static final long serialVersionUID = 1L;

	public StorageException(String message) {
        super(message);
    }

    public StorageException(String message, Throwable exception) {
        super(message, exception);
    }
}

//ESTO LO UTILIZO EN LAS LINEAS 35, 46 Y 53 DE FileSystemStorage DE service