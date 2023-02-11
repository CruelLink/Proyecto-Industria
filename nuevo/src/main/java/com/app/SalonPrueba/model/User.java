package com.app.SalonPrueba.model;

import java.time.LocalDate;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)		//AUTO-INCREMENTAL DE MySQL
	@Column(name = "iduser")
	private int id;
	
	@Column(name="nombre")
	private String nombre;
	
	@Column(name="direccion")
	private String direccion;
	
	
	@Column(name="correo")
	private String correo;
	
	@Column(name="telefono")
	private String telefono;
	

	@Column
	private String username;
	
	@NotBlank
	@Column
	private String password;
	
											//ESTOS CAMPOS YA SON DE ADMIN
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
	
	@Column(name="sexo")
	private String sexo;
	
	@Column(name="fechaNacimiento")							//VER SI FUNCIONA PORQUE NO DEBERIA SER LOCAL DATE, EN MySQL TENGO TIPO Date
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate fechaNacimiento;
	
	
	
	//VOY A CREAR UNA TERCERA TABLA authorities_users DONDE VOY A RELACIONAR LAS DOS TABLAS: User y Authority
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="authorities_users", 
	joinColumns = @JoinColumn(name ="usuario_id"), 
	inverseJoinColumns = @JoinColumn(name = "authority_id"))
	private Set<Authority> authority;
	
	public User() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
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

	public Set<Authority> getAuthority() {
		return authority;
	}

	public void setAuthority(Set<Authority> authority) {
		this.authority = authority;
	}
	
	
	//PARA ADMIN
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

	
	
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", nombre=" + nombre + ", direccion=" + direccion + ", correo=" + correo
				+ ", telefono=" + telefono + ", username=" + username + ", password=" + password + ", authority="
				+ authority + "]";
	}
	
	
	
	
}
