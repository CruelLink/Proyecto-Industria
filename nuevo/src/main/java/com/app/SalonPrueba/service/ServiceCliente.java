package com.app.SalonPrueba.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.SalonPrueba.model.Cliente;
import com.app.SalonPrueba.repository.RepositoryCliente;

@Service
public class ServiceCliente {
	@Autowired RepositoryCliente repositoryCliente;
	
	public void crearCliente(Cliente cliente) {
		this.repositoryCliente.save(cliente);
	}
	
	public Cliente buscarCliente(int id) {
		return this.repositoryCliente.findById(id);
	}
	
	public List<Cliente> obtenerClientes(){
		return this.repositoryCliente.findAll();
	}
	
	public void eliminarCliente(Cliente cliente) {
		this.repositoryCliente.delete(cliente);
	}
	
	
}
