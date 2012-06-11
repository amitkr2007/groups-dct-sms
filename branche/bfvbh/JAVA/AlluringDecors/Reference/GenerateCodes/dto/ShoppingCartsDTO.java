package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with ShoppingCarts table in database
public class ShoppingCartsDTO implements Serializable {

	private int iD;
	private int iDServiceOffered;
	private String cartID;
	private Date createDate;

	public ShoppingCartsDTO() {
		this.iD = 0;
		this.iDServiceOffered = 0;
		this.cartID = "";
		this.createDate = new Date();
	}

	public ShoppingCartsDTO(int id, int idserviceoffered, String cartid, Date createdate) {
		this.iD = id;
		this.iDServiceOffered = idserviceoffered;
		this.cartID = cartid;
		this.createDate = createdate;
	}

	public int getID() {
		return this.iD;
	}

	public void setID(int iD) {
		this.iD = iD;
	}

	public int getIDServiceOffered() {
		return this.iDServiceOffered;
	}

	public void setIDServiceOffered(int iDServiceOffered) {
		this.iDServiceOffered = iDServiceOffered;
	}

	public String getCartID() {
		return this.cartID;
	}

	public void setCartID(String cartID) {
		this.cartID = cartID;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
