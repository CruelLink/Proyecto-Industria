package com.app.SalonPrueba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.SalonPrueba.model.Administrador;

public interface RepositoryAdministrador extends JpaRepository<Administrador, Integer>{
	public Administrador findById(int id);

}
