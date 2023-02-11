package com.app.SalonPrueba.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.SalonPrueba.model.User;

public interface RepositoryUser extends JpaRepository<User, Integer>{
	
	public User findById(int id);				//ME SERVIRA PARA LOS SERVICE PARA BUSCAR AL USUARIO POR ID POR EJEMPLO
	
	public Optional <User> findByUsername(String username);	//PARA BUSCAR POR username (ESTE TRABAJA CON EL LOGIN)
}
