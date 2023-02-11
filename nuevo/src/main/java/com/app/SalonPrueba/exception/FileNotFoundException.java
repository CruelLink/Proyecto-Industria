package com.app.SalonPrueba.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)								//ESTE ERROR VA RETORNAR UN CODIGO Http O CODIGO 504............OSEA EL ERROR 404 (CUANDO NO ENCUENTRA)
public class FileNotFoundException extends RuntimeException {
 
	private static final long serialVersionUID = 1L;		//NOMAS POR QUE ME LO PIDE SE LO PONGO

	public FileNotFoundException(String message) {			//METODO QUE RECIBE UN MENSAJE
        super(message);										// super: ESE messaje SE LO ENVIO A LA CLASE PADRE
    }

    public FileNotFoundException(String message, Throwable exception) {			//METODO QUE RECIBE MENSAJE Y UN Throwable QUE VIENE SIENDOM UNA EXCEPCION SUPONGO 
        super(message, exception);
    }
}


//ESTO LO UTILIZO EN LAS LINEAS 75 Y 78 DE FileSystemStorage DE service