package com.app.SalonPrueba.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.SalonPrueba.service.FileSystemStorageService;





@RestController
@RequestMapping("/assets")			//TODAS LAS UTL DE ESTE CONTROLADOR COMIENZAN CON /assets
public class AssetController {		//CONTROLADOR DE ARCHIVOS (ESTE CONTROLADOR LO OCUPO PARA MOSTRAR LAS IMAGENES YA GUARADAS EN LAS VISTA PARA EL CLIENTE Y EL ADMIN)
    
	@Autowired
    private FileSystemStorageService fileSystemStorageService;			//INYECTO ESTA CLASE QUE ESTA EN SERVICE, RECORDAR QUE AQUI ES DONDE TRAABAJE PARA ALMACENAR LA IMAGEN

    @GetMapping("/{filename:.+}")
    Resource getResource(@PathVariable("filename") String filename) {	//VOY A USAR UN METODO "Resource" QUE VA A RETORNAR UN RECURSO
        return fileSystemStorageService.loadAsResource(filename);
    }
}

//INYECTO FileSystemStorageService PORQUE AHI TENGO EL METODO DE CARGAR ARCHIVOS loadAsResource 