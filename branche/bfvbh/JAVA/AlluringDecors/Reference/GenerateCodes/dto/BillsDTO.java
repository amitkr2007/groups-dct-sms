package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with Bills table in database
public class BillsDTO implements Serializable {

	private int iD;
	private int iDServiceRequest;
	private Date datePaid;
	private double balanceAmount;
	private double dueAmount;
	private double totalPaidAmont;

	public BillsDTO() {
		this.iD = 0;
		this.iDServiceRequest = 0;
		this.datePaid = new Date();
		this.balanceAmount = 0;
		this.dueAmount = 0;
		this.totalPaidAmont = 0;
	}

	public BillsDTO(int id, int idservicerequest, Date datepaid, double balanceamount, double dueamount, double totalpaidamont) {
		this.iD = id;
		this.iDServiceRequest = idservicerequest;
		this.datePaid = datepaid;
		this.balanceAmount = balanceamount;
		this.dueAmount = dueamount;
		this.totalPaidAmont = totalpaidamont;
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

	public Date getDatePaid() {
		return this.datePaid;
	}

	public void setDatePaid(Date datePaid) {
		this.datePaid = datePaid;
	}

	public double getBalanceAmount() {
		return this.balanceAmount;
	}

	public void setBalanceAmount(double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}

	public double getDueAmount() {
		return this.dueAmount;
	}

	public void setDueAmount(double dueAmount) {
		this.dueAmount = dueAmount;
	}

	public double getTotalPaidAmont() {
		return this.totalPaidAmont;
	}

	public void setTotalPaidAmont(double totalPaidAmont) {
		this.totalPaidAmont = totalPaidAmont;
	}

}
