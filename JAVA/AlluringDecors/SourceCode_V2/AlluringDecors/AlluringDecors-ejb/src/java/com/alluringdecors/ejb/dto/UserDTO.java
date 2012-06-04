/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.ejb.dto;

import java.util.Date;

/**
 *
 * @author Administrator
 */
public class UserDTO {

    private int iD;
    private String role;
    private String userName;
    private String password;
    private String name;
    private String address;
    private String phone;
    private String email;
    private Date birthday;
    private boolean sex;
    private Date startDate;
    private boolean alreadyPurchase;

    public UserDTO() {
        this.iD = 0;
        this.role = "Client";
        this.userName = "";
        this.password = "";
        this.name = "";
        this.address = "";
        this.phone = "";
        this.email = "";
        this.birthday = new Date();
        this.sex = false;
        this.startDate = new Date();
	this.alreadyPurchase = false;
    }

    public UserDTO(int id, String role, String username, String password, String name, String address, String phone, String email, Date birthday, boolean sex, Date startdate) {
        this.iD = id;
        this.role = role;
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

    public boolean isAlreadyPurchase()
    {
	return alreadyPurchase;
    }

    public void setAlreadyPurchase(boolean alreadyPurchase)
    {
	this.alreadyPurchase = alreadyPurchase;
    }


    public int getID() {
        return this.iD;
    }

    public void setID(int iD) {
        this.iD = iD;
    }

    public String getRole() {
        return this.role;
    }

    public void setRole(String role) {
        this.role = (role == null ? "" : role);
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = (userName == null ? "" : userName);
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = (password == null ? "" : password);
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = (name == null ? "" : name);;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = (address == null ? "" : address);;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = (phone == null ? "" : phone);;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = (email == null ? "" : email);;
    }

    public Date getBirthday() {
        return this.birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = (birthday == null ? new Date() : birthday);
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
        this.startDate = (startDate == null ? new Date() : startDate);
    }
}
