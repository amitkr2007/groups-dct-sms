package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with Roles table in database
public class RolesDTO implements Serializable {

	private int iD;
	private String name;

	public RolesDTO() {
		this.iD = 0;
		this.name = "";
	}

	public RolesDTO(int id, String name) {
		this.iD = id;
		this.name = name;
	}

	public int getID() {
		return this.iD;
	}

	public void setID(int iD) {
		this.iD = iD;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
