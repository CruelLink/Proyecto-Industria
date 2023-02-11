package com.app.SalonPrueba.controller;
//ESTE CONTROLADOR YA ES PARA LA VISTA DEL CLIENTE
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.SalonPrueba.model.Producto;
import com.app.SalonPrueba.repository.ProductosRepository;





@Controller
//@RequestMapping("")				//LAS URL NO LLEVAN NADA AL INICIO.
public class HomeController {

    @Autowired
    private ProductosRepository productoRepository;

    
    
  //MOSTRAR PRODUCTOS
    @GetMapping("/vistaClientes")
    ModelAndView listaPeliculas(@PageableDefault(sort = "nombre", direction = Sort.Direction.DESC)
                                        Pageable pageable) {			//VOY A RETORNAR UN OBJETO  Pageable pageable
        Page<Producto> productos = productoRepository.findAll(pageable);
        return new ModelAndView("vista-productos")
                .addObject("productos", productos);
    }//AHORA VOY A CREAR UN HTML (vista-productos.html)
 

}

//NO LE PUSE DETALLES PORQUE LOS PRODUCTOS SOLO SE VAN A MOSTRAR. EN LOS SERVICIOS SI DEBO PONER DETALLES