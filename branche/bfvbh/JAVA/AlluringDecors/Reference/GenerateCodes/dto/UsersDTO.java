package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with Users table in database
public class UsersDTO implements Serializable {

	private int iD;
	private int iDRole;
	private String userName;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String email;
	private Date birthday;
	private boolean sex;
	private Date startDate;

	public UsersDTO() {
		this.iD = 0;
		this.iDRole = 0;
		this.userName = "";
		this.password = "";
		this.name = "";
		this.address = "";
		this.phone = "";
		this.email = "";
		this.birthday = new Date();
		this.sex = false;
		this.startDate = new Date();
	}

	public UsersDTO(int id, int idrole, String username, String password, String name, String address, String phone, String email, Date birthday, boolean sex, Date startdate) {
		this.iD = id;
		this.iDRole = idrole;
		this.userName = username;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.birthday = birthday;
		this.sex = sex;
		this.startDate = startdate;
	}

	public int getID() {
		return this.iD;
	}

	public void setID(int iD) {
		this.iD = iD;
	}

	public int getIDRole() {
		return this.iDRole;
	}

	public void setIDRole(int iDRole) {
		this.iDRole = iDRole;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public boolean getSex() {
		return this.sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

}
