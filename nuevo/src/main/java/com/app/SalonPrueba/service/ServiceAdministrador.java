package com.app.SalonPrueba.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.SalonPrueba.model.Administrador;
import com.app.SalonPrueba.repository.RepositoryAdministrador;

@Service
public class ServiceAdministrador {

	@Autowired RepositoryAdministrador repositoryAdministrador;
	
	
	public void crearAdministrador(Administrador administrador) {
		this.repositoryAdministrador.save(administrador);
	}
	
	public Administrador buscarAdministrador(int id) {
		return this.repositoryAdministrador.findById(id);
	}
	
	public List<Administrador> obtenerAdministradors(){
		return this.repositoryAdministrador.findAll();
	}
	
	public void eliminarCliente(Administrador administrador) {
		this.repositoryAdministrador.delete(administrador);
	}
	
	
}
