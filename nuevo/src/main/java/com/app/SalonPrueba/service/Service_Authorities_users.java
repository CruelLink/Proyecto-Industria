package com.app.SalonPrueba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.SalonPrueba.model.Authorities_users;
import com.app.SalonPrueba.repository.Repository_Authorities_users;

@Service
public class Service_Authorities_users {
	
	@Autowired Repository_Authorities_users repository_Authorities_users;
	
	public void crear_Authorities_users(Authorities_users authorities_users) {
		
		this.repository_Authorities_users.save(authorities_users);
	}
}

//ESTE SERVICIO ES PARA IR A GUARDAR EN LA TABLA DE USUARIO_AUTORIDAD.... QUE EL USUARIO ES USER O ADMIN