package com.app.SalonPrueba.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.SalonPrueba.model.Producto;
import com.app.SalonPrueba.repository.ProductosRepository;
import com.app.SalonPrueba.service.FileSystemStorageService;

import groovyjarjarpicocli.CommandLine.Model;


@Controller
public class AdminControllerProductoServicios {

	@Autowired private ProductosRepository productoRepository;
	@Autowired private FileSystemStorageService fileSystemStorageService;

	
	//===========================================================================================================
	//==========================================EPRODUCTO========================================================
	//===========================================================================================================
	
	//--------------------------------------------------------------------------
	//LISTADO DE PRODUCTO PARA ADMIN			localhost:8080/admin/listadoProductos
	//--------------------------------------------------------------------------
	@GetMapping("/admin/listadoProductos")
	ModelAndView index(@PageableDefault(sort="nombre", size=5) Pageable pageable) {
		Page<Producto> productos = productoRepository.findAll(pageable);
		
		return new ModelAndView("admin/listado_productos").addObject("productos", productos);
	}
	
	
	//--------------------------------------------------------------------------
	//CREAR PRODUCTO			localhost:8080/admin/producto/nuevo
	//--------------------------------------------------------------------------
	@GetMapping("/admin/producto/nuevo")
	ModelAndView nuevoProducto() {
		
		return new ModelAndView("admin/crear_producto")
				.addObject("producto", new Producto());
	}
	
	
	@RequestMapping(value= "/admin/producto/nuevo", method=RequestMethod.POST)
	//@PostMapping("/admin/producto/nuevo")
	ModelAndView crearProducto(@Validated Producto producto, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors() || producto.getImagen().isEmpty()) {
			if(producto.getImagen().isEmpty()) {
				bindingResult.rejectValue("imagen", "MultiparNotEmpty");
			}
			
			return new ModelAndView("admin/crear_producto").addObject("producto", producto);
		}
		
		//SI NO HAY ERROR
		String ruta_imagen = fileSystemStorageService.storage(producto.getImagen());
		producto.setRuta_imagen(ruta_imagen);
		
		productoRepository.save(producto);
		return new ModelAndView("redirect:/admin/listadoProductos");
	}
	
	
	//--------------------------------------------------------------------------
	//EDITAR PRODUCTO			localhost:8080/admin/producto/{id}/editar
	//--------------------------------------------------------------------------
	@GetMapping("/admin/productos/{id}/editar")
	ModelAndView editarProducto(@PathVariable Integer id) {
		
		Producto producto = productoRepository.getOne(id); 
		
		return new ModelAndView("admin/editar-producto").addObject(producto);
	}
	
	
	@PostMapping("/admin/productos/{id}/editar")
	//@RequestMapping(value= "/admin/productos/{id}/editar", method=RequestMethod.POST)
	ModelAndView editarProducto(@PathVariable Integer id, @Validated Producto producto, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return new ModelAndView("admin/editar-producto").addObject(producto);
		}
		
		//SI TODO LA VALIDACION ESTA CORRECTA ENTONCES ACTUALIZO LOS CAMPOS
		Producto productoFromDb = productoRepository.getOne(id);
		
		productoFromDb.setNombre(producto.getNombre());
		productoFromDb.setDescripcion(producto.getDescripcion());
		productoFromDb.setPrecio(producto.getPrecio());
		
		//AHORA CAMBIO LA IMAGEN; PARA ELLO DEBO ELIMINAR LA QUE TENIA Y AGREGAR UNA NUEVA IMAGEN
		if(!producto.getImagen().isEmpty()) {										//SI EL CAMPO DE IMAGEN NO ESTA VACIA ENTONCES VOY A CAPTURAR ESA
			fileSystemStorageService.delete(productoFromDb.getRuta_imagen());		//LA VOY A BORRAR (OJO: BORRAR DE LA BASE DE DATOS)
			String ruta_imagen = fileSystemStorageService.storage(producto.getImagen());
			productoFromDb.setRuta_imagen(ruta_imagen);
		}
		productoRepository.save(productoFromDb);		//GUARDO LOS CAMBIOS
		
		return new ModelAndView("redirect:/admin/listadoProductos");
	}
	
	
	//--------------------------------------------------------------------------
	//ELIMINAR PRODUCTO			localhost:8080/admin/producto/{id}/editar
	//--------------------------------------------------------------------------
	@PostMapping("/admin/productos/{id}/eliminar")
	String eliminarProducto(@PathVariable Integer id) {
		Producto producto = productoRepository.getOne(id);
		
		productoRepository.delete(producto);							//ELIMINO DE LA BASE DE DATOS LOS CAMPOS
		fileSystemStorageService.delete(producto.getRuta_imagen());		//ELIMINO LA IMAGEN
		
		return "redirect:/admin/listadoProductos";
	}
	
	
}