package com.app.SalonPrueba.service;
//STORAGE -> ALMACENAMIENTO
import java.nio.file.Path;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

//AQUI NO LE PUSO @Service PORQUE ES UNA INTERFACE QUE VOY A LLAMARLA DESDE EL OTRO ARCHIVO (FileSystemStorageService)
public interface StorageService {
    void init();
    String storage(MultipartFile file);				//METODO PARA ALMACENAR UN ARCHIVO
    Path load(String filename);						//UN METODO QUE VA RETORNAR UN PATH... QUE VA RECIBIR EL NOMBRE DE UN ARCHIVO
    Resource loadAsResource(String filename);		//UN METODO QUE VA A RETORNAR UN Resource(RECURSO)... VA RECIBIR TAMBIEN EL NOMBRE DE UN ARCHIVO
    void delete(String filename);	
}

//CON LOS SERVICIOS ESQUE HAGO LAS TAREAS QUE SE VAN HACER DESDE LA PAGINA WEB

/*1. POR LO QUE ENTIENDO MultipartFile ES COMO UNA VARIABLE String
  2. storage, load, loadAsResource, delete    YA SON FUNCIONES DE CARGAR IMAGENES SUPONGO*/

/*MultipartFile: La Spring proporciona una interfaz MultipartFile para manejar solicitudes HTTP de varias partes para cargar archivos. 
Las solicitudes de archivos de varias partes dividen los archivos grandes en trozos más pequeños, lo que lo hace eficiente para la carga de archivos.*/


/*Resource: RECURSO
  Path: SENDERO(ASAVER QUE PUTAS)
 */