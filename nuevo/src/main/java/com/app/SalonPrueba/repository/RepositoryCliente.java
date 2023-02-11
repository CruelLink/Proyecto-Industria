package com.app.SalonPrueba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.SalonPrueba.model.Cliente;

public interface RepositoryCliente extends JpaRepository<Cliente, Integer>{
	public Cliente findById(int id);

}
