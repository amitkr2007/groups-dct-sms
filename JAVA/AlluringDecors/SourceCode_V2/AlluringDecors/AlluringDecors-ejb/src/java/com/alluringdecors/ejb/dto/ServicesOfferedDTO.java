package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with ServicesOffered table in database
public class ServicesOfferedDTO implements Serializable {

    private int iD;
    private int iDDomainList;
    private String name;
    private double price;
    private String description;
    private String briefDescription;
    private String image;
    private DomainListDTO domainList;

    public ServicesOfferedDTO() {
        this.iD = 0;
        this.iDDomainList = 0;
        this.name = "";
        this.price = 0;
        this.description = "";
        this.briefDescription = "";
        this.image = "";
    }

    public ServicesOfferedDTO(int id, int iddomainlist, String name, double price, String description, String briefdescription, String image) {
        this.iD = id;
        this.iDDomainList = iddomainlist;
        this.name = name;
        this.price = price;
        this.description = description;
        this.briefDescription = briefdescription;
        this.image = image;
    }

    public int getID() {
        return this.iD;
    }

    public void setID(int iD) {
        this.iD = iD;
    }

    public int getIDDomainList() {
        return this.iDDomainList;
    }

    public void setIDDomainList(int iDDomainList) {
        this.iDDomainList = iDDomainList;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return the domainList
     */
    public DomainListDTO getDomainList() {
        return domainList;
    }

    /**
     * @param domainList the domainList to set
     */
    public void setDomainList(DomainListDTO domainList) {
        this.domainList = domainList;
    }
}
