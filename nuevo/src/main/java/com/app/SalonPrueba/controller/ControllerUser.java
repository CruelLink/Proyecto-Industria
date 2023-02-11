package com.app.SalonPrueba.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.SalonPrueba.model.Administrador;
import com.app.SalonPrueba.model.Authorities_users;
import com.app.SalonPrueba.model.Cliente;
import com.app.SalonPrueba.model.User;
import com.app.SalonPrueba.service.ServiceAdministrador;
import com.app.SalonPrueba.service.ServiceCliente;
import com.app.SalonPrueba.service.ServiceUser;
import com.app.SalonPrueba.service.Service_Authorities_users;
import com.app.SalonPrueba.utiles.GenerarPassword;


@Controller
public class ControllerUser {

	@Autowired private ServiceUser serviceUser;
	@Autowired private Service_Authorities_users service_Authorities_users;
	@Autowired private ServiceCliente serviceCliente;
	@Autowired private ServiceAdministrador serviceAdministrador;
	
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(4);			//CREO QUE ESTO NO HACE NADA (PERO ESTO SIRVE PARA ENCRIPTAR EL PASSWORD)... YO ESTOY ENCRIPTANDO EL PASSOWRD DESDE EL ServiceUser
	
	//================================================================================
	//		INICIO: LA PANTALLA INICIAL				http://localhost:8080
	//================================================================================
	@GetMapping("/")	
	public String inicio() {
		return "inicio-global";
	}
	
	@GetMapping("/user/inicio")				//ESTAS PAGINAS LAS USE PARA PRBAR LOS PRIVILEGIOS DE USER Y ADMIN
	public String userinicio() {
		return "inicio-global";
	}
	
	@GetMapping("/user/probando")
	public String probando() {
		return "user";
	}
	
	//--------------------------------------------------------------------------------
	
	//================================================================================
	//		LOGIN: ME LLEVA A LA PAGINA DEL LOGIN				http://localhost:8080/login
	//================================================================================
	@GetMapping("/login")	
	public String login() {
		return "login";
	}
	
	@GetMapping("/accesoDenegado")
	public String accesoDenegado() {
		return "accesoDenegado";
	}
	
	//===================================================================================================================================================================================================
	//		REGISTRAR USUARIO - CLIENTE				http://localhost:8080/cliente/Registrar
	//===================================================================================================================================================================================================
	@GetMapping("/registroUser")	
	public String registroUser() {
		return "registroUser";
	}
					 
	@RequestMapping(value = "/usuario/crearUsuario", method=RequestMethod.POST)			
	public String crearUser(															//ESE name TIENE QUE IR IGUAL EN FORMULARIO DEL FRONTEND
								@RequestParam(name="nombre") String nombre,
								@RequestParam(name="correo") String correo,
								@RequestParam(name="telefono") String telefono,
								@RequestParam(name="username") String username,
								@RequestParam(name="password") String password){
		
		User user = new User(); 								//NO ESTOY USANDO CONSTRUCTOR COMO ENSEÑO LUQUE... SINO QUE CREO EL OBJETO Y A ESE OBJETO LE AGREGO LOS CAMPOS POR SETTER
		Cliente cliente = new Cliente();						//VOY A CREAR UN CLIENTE, ESE USUARIO QUE SE REGISTRE LO VOY A MANDAR A LA TABLA clientes (LA AHGO PARA GUARDAR LA CONTRASEÑA SIN ENCRIPTAR)
		
		user.setNombre(nombre);
		user.setCorreo(correo);
		user.setUsername(username);
		user.setPassword(password);
		cliente.setPassword(user.getPassword());			//VOY A GUARDAR LA CONTRASEÑA SIN ENCRIPTAR EN LA TABLA clientes
		this.serviceUser.crearUser(user);					//AQUI YA LLAMO EL ServiceUser "crearUser" PARA GUARDAR EN LA BD PERO ANTES DE GUARDAR VA ENCRIPTAR EL PASSWORD Y SEGUIDAMENTE LO GUARDA EN LA BD
	
		//DARLE EL ROL AUTOMATICAMENTE DE "USER"
		Authorities_users authorities_users = new Authorities_users();
		authorities_users.setUsuario_Id(user.getId());								//QUE OBTENGA EL ID DEL USUARIO QUE SE ESTA REGISTRANDO AHORITA
		authorities_users.setAuthority_id(2);										//A ESE USUARIO QUE SE ESTA REGISTRANDO LE ESTOY ASIGANDO EL Authority 2 QUE ES USER
		this.service_Authorities_users.crear_Authorities_users(authorities_users);
		
		//GUARDAR LOS DATOS DEL FORMULARIO TAMBIEN EN LA TABLA CLIENTES... ANTES CREE EL OBJETO TIPO clientes PARA GUARDAR EL PASSWORD RNCRIPTADO
		cliente.setUsuario(user);						//MANDAR A ESE USUARIO A LA TABLA DE CLIENTE
		cliente.setNombre(user.getNombre());
		cliente.setCorreo(user.getCorreo());
		cliente.setTelefono(user.getTelefono());
		cliente.setUsername(user.getUsername());
		this.serviceCliente.crearCliente(cliente);
		
		
		//enviarCorreo.sendEmail(correo, "Usuario", "Te hemos registrado en nuestra base de datos de clientes.");
		return "inicio-global";								//QUE CUANDO LE DE EN EL BOTON REGISTRARSE ME RETORNE A LA PAGINA DE INICIO						
	}
	
	
	
		//===================================================================================================================================================================================================
		//		REGISTRAR USUARIO - ADMIN   --ojo no esta todo revisado, hace falta frontend--		http://localhost:8080/admin/Registrar
		//===================================================================================================================================================================================================
		@GetMapping("/registroAdmin")	
		public String registroAdmin() {
			return "registroAdmin";
		}
						 
		@RequestMapping(value = "/admin/crearAdmin", method=RequestMethod.POST)			
		public String crearAdmin(															//ESE name TIENE QUE IR IGUAL EN FORMULARIO DEL FRONTEND
									@RequestParam(name="primerNombre") String primerNombre,
									@RequestParam(name="segundoNombre") String segundoNombre,
									@RequestParam(name="primerApellido") String primerApellido,
									@RequestParam(name="segundoApellido") String segundoApellido,
									@RequestParam(name="dni") String dni,
									@RequestParam(name="direccion") String direccion,
									@RequestParam(name="correo") String correo,
									@RequestParam(name="telefono") String telefono,
									@RequestParam(name="sexo") String sexo,
									@RequestParam(name="fechaNacimiento") @DateTimeFormat(iso = ISO.DATE) LocalDate fechaNacimiento,
									@RequestParam(name="username") String username,
									@RequestParam(name="password") String password){
			
			User user2 = new User(); 								//NO ESTOY USANDO CONSTRUCTOR COMO ENSEÑO LUQUE... SINO QUE CREO EL OBJETO Y A ESE OBJETO LE AGREGO LOS CAMPOS POR SETTER
			Administrador administrador = new Administrador();						//VOY A CREAR UN CLIENTE, ESE USUARIO QUE SE REGISTRE LO VOY A MANDAR A LA TABLA clientes (LA AHGO PARA GUARDAR LA CONTRASEÑA SIN ENCRIPTAR)
			
			user2.setPrimerNombre(primerNombre);
			user2.setSegundoNombre(segundoNombre);
			user2.setPrimerApellido(primerApellido);
			user2.setSegundoApellido(segundoApellido);
			user2.setDni(dni);
			user2.setDireccion(direccion);
			user2.setCorreo(correo);
			user2.setTelefono(telefono);
			user2.setSexo(sexo);
			user2.setFechaNacimiento(fechaNacimiento);
			user2.setUsername(username);
			user2.setPassword(password);
			
			administrador.setPassword(user2.getPassword());			//VOY A GUARDAR LA CONTRASEÑA SIN ENCRIPTAR EN LA TABLA Administradores
			this.serviceUser.crearUser(user2);					//AQUI YA LLAMO EL ServiceUser "crearUser" PARA GUARDAR EN LA BD PERO ANTES DE GUARDAR VA ENCRIPTAR EL PASSWORD Y SEGUIDAMENTE LO GUARDA EN LA BD
		
			//DARLE EL ROL AUTOMATICAMENTE DE "USER"
			Authorities_users authorities_users2 = new Authorities_users();
			authorities_users2.setUsuario_Id(user2.getId());								//QUE OBTENGA EL ID DEL USUARIO QUE SE ESTA REGISTRANDO AHORITA
			authorities_users2.setAuthority_id(1);										//A ESE USUARIO QUE SE ESTA REGISTRANDO LE ESTOY ASIGANDO EL Authority 1 QUE ES ADMIN
			this.service_Authorities_users.crear_Authorities_users(authorities_users2);
			
			//GUARDAR LOS DATOS DEL FORMULARIO TAMBIEN EN LA TABLA administradores DE LA BD... ANTES CREE EL OBJETO TIPO administradores PARA GUARDAR EL PASSWORD RNCRIPTADO
			administrador.setUsuario(user2);						//MANDAR A ESE USUARIO A LA TABLA DE administradores
			administrador.setPrimerNombre(user2.getPrimerNombre());
			administrador.setSegundoNombre(user2.getSegundoNombre());
			administrador.setPrimerApellido(user2.getPrimerApellido());
			administrador.setSegundoApellido(user2.getSegundoApellido());
			administrador.setDni(user2.getDni());
			administrador.setDireccion(user2.getDireccion());
			administrador.setCorreo(user2.getCorreo());
			administrador.setTelefono(user2.getTelefono());
			administrador.setSexo(user2.getSexo());
			administrador.setFechaNacimiento(user2.getFechaNacimiento());
			administrador.setUsername(user2.getUsername());
			this.serviceAdministrador.crearAdministrador(administrador);
			
			
			//enviarCorreo.sendEmail(correo, "Usuario", "Te hemos registrado en nuestra base de datos de clientes.");
			return "admin/admin-inicio";								//QUE CUANDO LE DE EN EL BOTON REGISTRARSE ME RETORNE A LA PAGINA DE INICIO						
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	@GetMapping("/admin/inicio")	
	public String admin() {
		return "admin/admin-inicio";
	}
	
	@GetMapping("/adminEditar")	
	public String adminEditar() {
		return "admin/adminEditar";
	}
	
	
	
	
	
	
	
	
	
	@GetMapping("/index")	
	public String index() {
		return "index";
	}
	
	
	
	
}


