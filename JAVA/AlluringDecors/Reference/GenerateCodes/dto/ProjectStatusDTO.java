package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with ProjectStatus table in database
public class ProjectStatusDTO implements Serializable {

	private int iD;
	private String name;

	public ProjectStatusDTO() {
		this.iD = 0;
		this.name = "";
	}

	public ProjectStatusDTO(int id, String name) {
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
