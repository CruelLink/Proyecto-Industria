package com.app.SalonPrueba.service;

//PASO 11: BUSCAR EL username QUE ESTA INTENTANDO INICIAR SESION EN LA BASE DE DATOS
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.app.SalonPrueba.model.Authority;
import com.app.SalonPrueba.repository.RepositoryUser;


@Service
public class UserDetailsServiceImpl implements UserDetailsService {			//VOY A IMPLEMENTAR UserDetailsService QUE VIENE SE SpringSecurity

  @Autowired
  RepositoryUser userRepository;
	
  @Override
   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {			//VOY A BUSCAR Y CARGAR AL USUARIO POR username PORQUE ASI LO TENGO EN LA CONFIGURACION DE Security EN EL PASO 6, 7 Y 8
		
	  																																//Buscar el usuario con el repositorio y si no existe lanzar una exepcion
	  com.app.SalonPrueba.model.User appUser = 																							//appUser: CREARE MI USUARIO...BUSCANDOLO MEDIANTE EL username EN EL REPOSITORIO
			  userRepository.findByUsername(username).orElseThrow(() -> new UsernameNotFoundException("No existe usuario"));		//userRepository.findByUsername: AL REPOSITORIO LE DIGO (ENCUENTRE EL username )
	  																																//.orElseThrow: SI NO ENCUENTRAS NADA CON ESE username TIRAME UN EXCEPTION QUE DIGA "No existe usuario"
																																	  //Mapear nuestra lista de Authority con la de spring security 
																																	  //AQUI VOY A VER TODAS LAS AUTORIDADES O ROLES QUE TENGA ESE USUARIO (PARA VER SI ES ADMIN O USER) Y VOY A MAPEARLO A OTRO OBJETO (GrantedAuthority) DE SpringSecurity 
	  List grantList = new ArrayList();
	  for (Authority authority: appUser.getAuthority()) {
	      //ROLE_USER, ROLE_ADMIN,..
	      GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(authority.getAuthority());
	          grantList.add(grantedAuthority);
	  }
		
	  																											//UNA VEZ YA MAPEADO LOS ROLES (AUTORIDADES) LE DECIMOS CUAL ES EL USUARIO Y CUAL ES EL PASSWORD ENCRIPTADO Y LA LISTA DE ROLES QUE TIENE ESE USUARIO (grantList)
	  																											//Crear El objeto UserDetails que va a ir en sesion y retornarlo.
	  UserDetails user = (UserDetails) new User(appUser.getUsername(), appUser.getPassword(), grantList);
	       return user;
	 
  }
}


