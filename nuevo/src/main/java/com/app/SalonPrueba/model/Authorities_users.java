package com.app.SalonPrueba.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authorities_users")
public class Authorities_users {

	@Id
	@Column
	private int usuario_Id;
	@Column
	private int authority_id;
	
	
	public Authorities_users() {}
	
	
	public int getUsuario_Id() {
		return usuario_Id;
	}
	public void setUsuario_Id(int usuario_Id) {
		this.usuario_Id = usuario_Id;
	}
	public int getAuthority_id() {
		return authority_id;
	}
	public void setAuthority_id(int authority_id) {
		this.authority_id = authority_id;
	}
	
	
	
	
}
