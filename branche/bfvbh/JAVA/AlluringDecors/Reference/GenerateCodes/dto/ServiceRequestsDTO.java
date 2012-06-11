package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with ServiceRequests table in database
public class ServiceRequestsDTO implements Serializable {

	private int iD;
	private int iDUser;
	private int iDRequestStatus;
	private Date requestDate;

	public ServiceRequestsDTO() {
		this.iD = 0;
		this.iDUser = 0;
		this.iDRequestStatus = 0;
		this.requestDate = new Date();
	}

	public ServiceRequestsDTO(int id, int iduser, int idrequeststatus, Date requestdate) {
		this.iD = id;
		this.iDUser = iduser;
		this.iDRequestStatus = idrequeststatus;
		this.requestDate = requestdate;
	}

	public int getID() {
		return this.iD;
	}

	public void setID(int iD) {
		this.iD = iD;
	}

	public int getIDUser() {
		return this.iDUser;
	}

	public void setIDUser(int iDUser) {
		this.iDUser = iDUser;
	}

	public int getIDRequestStatus() {
		return this.iDRequestStatus;
	}

	public void setIDRequestStatus(int iDRequestStatus) {
		this.iDRequestStatus = iDRequestStatus;
	}

	public Date getRequestDate() {
		return this.requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

}
