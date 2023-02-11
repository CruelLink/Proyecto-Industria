package com.app.SalonPrueba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.SalonPrueba.model.Producto;


public interface ProductosRepository extends JpaRepository<Producto, Integer>{

}
