package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with Projects table in database
public class ProjectsDTO implements Serializable {

	private int iD;
	private int iDServiceRequest;
	private int iDProjectStatus;
	private String name;
	private String image;
	private String description;
	private String briefDescription;
	private Date startDate;

	public ProjectsDTO() {
		this.iD = 0;
		this.iDServiceRequest = 0;
		this.iDProjectStatus = 0;
		this.name = "";
		this.image = "";
		this.description = "";
		this.briefDescription = "";
		this.startDate = new Date();
	}

	public ProjectsDTO(int id, int idservicerequest, int idprojectstatus, String name, String image, String description, String briefdescription, Date startdate) {
		this.iD = id;
		this.iDServiceRequest = idservicerequest;
		this.iDProjectStatus = idprojectstatus;
		this.name = name;
		this.image = image;
		this.description = description;
		this.briefDescription = briefdescription;
		this.startDate = startdate;
	}

	public int getID() {
		return this.iD;
	}

	public void setID(int iD) {
		this.iD = iD;
	}

	public int getIDServiceRequest() {
		return this.iDServiceRequest;
	}

	public void setIDServiceRequest(int iDServiceRequest) {
		this.iDServiceRequest = iDServiceRequest;
	}

	public int getIDProjectStatus() {
		return this.iDProjectStatus;
	}

	public void setIDProjectStatus(int iDProjectStatus) {
		this.iDProjectStatus = iDProjectStatus;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBriefDescription() {
		return this.briefDescription;
	}

	public void setBriefDescription(String briefDescription) {
		this.briefDescription = briefDescription;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

}
