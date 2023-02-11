package com.app.SalonPrueba.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.app.SalonPrueba.model.User;
import com.app.SalonPrueba.repository.RepositoryUser;

@Service
public class ServiceUser {
	
	@Autowired RepositoryUser repositoryUser;
	@Autowired private BCryptPasswordEncoder encriptarPassword;					//CON ESTA CLASE BCryptPasswordEncoder SU FUNCION ES ENCRIPTAR PASSWORD
	
	
	//GUARDAR USUARIO
	public void crearUser(User user) {
		//ENCRIPTO EL PASSWORD ANTES DE GUARDAR EL USUARIO EN LA BD...OJO ESE get.Password ES EL PASSWORD QUE ESTA INTRODUJO EL USUARIO EN EL FRONTEND ENTONCES LO QUE HAGO ES ENCRIPTAR EL PASSWORD ANETS DE GUARDAR EN LA BD
		user.setPassword(encriptarPassword.encode(user.getPassword()));
		this.repositoryUser.save(user);
	}
	
	public User buscarUser(int id) {
		return this.repositoryUser.findById(id);
	}
	
	public List<User> obtenerUsuarios(){
		return this.repositoryUser.findAll();			//PARA OBTENEDOR EL EXTENDS DEL Repository TIENE QUE SER JPARepository Y NO CRUDRepository
	}
	
	public void eliminarUser(User user) {
		this.repositoryUser.delete(user);
	}
	
}

