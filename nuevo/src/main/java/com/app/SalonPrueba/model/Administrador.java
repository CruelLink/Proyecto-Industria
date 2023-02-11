package com.app.SalonPrueba.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="administradores")
public class Administrador {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)		//AUTO-INCREMENTAL DE MySQL
	@Column(name="idAdministradores")
	private int idAdministradores;
	
	@Column(name="primerNombre")
	private String primerNombre;
	
	@Column(name="segundoNombre")
	private String segundoNombre;
	
	@Column(name="primerApellido")
	private String primerApellido;
	
	@Column(name="segundoApellido")
	private String segundoApellido;
	
	@Column(name="dni")
	private String dni;
	
	@Column(name="direccion")
	private String direccion;
	
	@Column(name="correo")
	private String correo;
	
	@Column(name="telefono")
	private String telefono;
	
	@Column(name="sexo")
	private String sexo;
	
	@Column(name="fechaNacimiento")							//VER SI FUNCIONA PORQUE NO DEBERIA SER LOCAL DATE, EN MySQL TENGO TIPO Date
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate fechaNacimiento;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;

	@ManyToOne							//QUE ESTA RELACIONADO A OTRA TABLA
	@JoinColumn(name="usuario_id")		//PERO OJO: ESE CAMPO ES EL QUE PUSE EN LA TABLA administradores
	@JsonBackReference
	private User usuario;
	
	
	public Administrador() {}


	public int getIdAdministradores() {
		return idAdministradores;
	}

	public void setIdAdministradores(int idAdministradores) {
		this.idAdministradores = idAdministradores;
	}

	public String getPrimerNombre() {
		return primerNombre;
	}

	public void setPrimerNombre(String primerNombre) {
		this.primerNombre = primerNombre;
	}

	public String getSegundoNombre() {
		return segundoNombre;
	}

	public void setSegundoNombre(String segundoNombre) {
		this.segundoNombre = segundoNombre;
	}

	public String getPrimerApellido() {
		return primerApellido;
	}

	public void setPrimerApellido(String primerApellido) {
		this.primerApellido = primerApellido;
	}

	public String getSegundoApellido() {
		return segundoApellido;
	}

	public void setSegundoApellido(String segundoApellido) {
		this.segundoApellido = segundoApellido;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User getUsuario() {
		return usuario;
	}

	public void setUsuario(User usuario) {
		this.usuario = usuario;
	}
	
	
	
	
	
}
