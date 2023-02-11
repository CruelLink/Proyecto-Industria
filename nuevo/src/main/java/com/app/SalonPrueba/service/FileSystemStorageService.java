package com.app.SalonPrueba.service;
//File System Storage Service: SERVICIO DE ALMACENAMIENTO DEL SISTEMAS DE ARCHIVOS.... File(ARCHIVOS)
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

import com.app.SalonPrueba.exception.FileNotFoundException;
import com.app.SalonPrueba.exception.StorageException;



@Service
public class FileSystemStorageService implements StorageService {		//VOY A IMPLEMENTAR LA INTERFACE StorageService QUE YO CREE Y VOY A USARLA AQUI

    @Value("${storage.location}")			//VOY A CARGAR LA ULTIMA PROPIEDAD (LINEA 15) DE application.properties
    private String storageLocation;			//ESTA PROPIEDAD SE VA ALMACENAR UNA VARIABLE

    @PostConstruct							//ESTE METODO init() VA EJECUTARSE CADA VEZ QUE HAYA UN INSTANCIA DE ESTA CLASE QUE SEA CREADA
    @Override
    public void init() {
        try {
            Files.createDirectories(Paths.get(storageLocation));			//ESTE METODO ME VA ASEGURAR QUE SIEMPRE HAYA UN DIRECTORIO PARA ALMACENAR LOS ARCHIVOS QUE EL USUARIO VAYA ENVIARME DESDE LA PAGINA WEB
        } catch (IOException e) {				//CAPTURAR EL ERROR
            throw new StorageException("Error al inicializar la ubicación del almacén de archivos.");
        }
    }
    

    @Override
    public String storage(MultipartFile file) {
        String filename = file.getOriginalFilename();				//

        if (file.isEmpty()) {				//SI EL ARCHIVO(file) ESTA VACIO ENTONCES VOY A LANZAR UN EXCEPCION
            throw new StorageException("No se puede almacenar un archivo vacío.");
        }

        try {		//PARA PODER ALMACENAR ESTE ARCHIVO (ESTE MultipartFile)
            InputStream inputStream = file.getInputStream();			//PRIMERO DEBO OBTENER EL InputStream CON getInputStream Y LO VOY ALMACENAR EN UN OBJETO (inputStream) TIPO InputStream 
            Files.copy(inputStream, Paths.get(storageLocation).resolve(filename), StandardCopyOption.REPLACE_EXISTING);		//Y VOY A COPIAR O ALMACENAR (copy), EL OBJETO, LA RUTA, StandardCopyOption.REPLACE_EXISTING): SI ENCUENTRA EL ARCHIVO CON EL MISMO NOMBRE PUES QUE LO REMPLACE 
        } catch (IOException e) {										//EXCEPCION SI HAY ERROR
            throw new StorageException("Error al almacenar el archivo " + filename, e);
        }
        return filename;					//SI TODO ESTA CORRECTO VOY A RETORNA EL NOMBRE DEL ARCHIVO
    }
    

    @Override
    public Path load(String filename) {
        return Paths.get(storageLocation).resolve(filename);			//PARA CARGAR UN ARCHIVO MEDIANTE SU NOMBRE
    }
    
    
    @Override															//PARA CARGAR UN ARCHIVO MEDIANTE SU NOMBRE Y CARGAR UN Resource
    public Resource loadAsResource(String filename) {
        try {
            Path file = load(filename);									//COMO EL ANTERIOR VOY A UTILIZAR UN Load Y VOY A CAPTURARLO CON Path
            Resource resource = new UrlResource(file.toUri());			//LUEGO VOY A CONVERTIRLO EN Resource
            if (resource.exists() || resource.isReadable()) {			//SI EL RECURSO(resource) EXISTE Ó EL RECURSO EL LEIBLE
                return resource;										//ENTONCES VOY A RETORNAR EL RECURSO
            } else {
                throw new FileNotFoundException("No se pudo encontrar el archivo: " + filename);
            }
        } catch (MalformedURLException e) {
            throw new FileNotFoundException("No se pudo encontrar el archivo: " + filename, e);
        }
    }

    
    @Override			//PARA ELIMINAR UN ARCHIVO MEDIANTE SU NOMBRE
    public void delete(String filename) {
        Path file = load(filename);					//PARA OBTENER EL ARCHIVO MEDIANTE SU NOMBRE
        try {
            FileSystemUtils.deleteRecursively(file);			//deleteRecursively: ELIMINAR RECURSIVAMENTE
        } catch (IOException e) {								//SI CAPTURA UN ERROR SIEMPLEMENTE NO VOY HACER NADA
        }
               
        
    }
}