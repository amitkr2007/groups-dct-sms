package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with ServiceRequestDetail table in database
public class ServiceRequestDetailDTO implements Serializable {

	private int iD;
	private int iDServiceRequest;
	private int iDServiceOffered;
	private double price;
	private String locationRequest;

	public ServiceRequestDetailDTO() {
		this.iD = 0;
		this.iDServiceRequest = 0;
		this.iDServiceOffered = 0;
		this.price = 0;
		this.locationRequest = "";
	}

	public ServiceRequestDetailDTO(int id, int idservicerequest, int idserviceoffered, double price, String locationrequest) {
		this.iD = id;
		this.iDServiceRequest = idservicerequest;
		this.iDServiceOffered = idserviceoffered;
		this.price = price;
		this.locationRequest = locationrequest;
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

	public int getIDServiceOffered() {
		return this.iDServiceOffered;
	}

	public void setIDServiceOffered(int iDServiceOffered) {
		this.iDServiceOffered = iDServiceOffered;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getLocationRequest() {
		return this.locationRequest;
	}

	public void setLocationRequest(String locationRequest) {
		this.locationRequest = locationRequest;
	}

}
