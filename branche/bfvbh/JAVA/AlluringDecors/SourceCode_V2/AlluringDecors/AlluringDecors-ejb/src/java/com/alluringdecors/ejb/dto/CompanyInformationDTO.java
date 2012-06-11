package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with CompanyInformation table in database
public class CompanyInformationDTO implements Serializable {

    private int iD;
    private String address;
    private String phone;
    private String companyDescription;
    private String serviceDescription;
    private String briefCompanyDescription;
    private String briefServiceDescription;
    private String preferExplanation;

    public CompanyInformationDTO() {
        this.iD = 0;
        this.address = "";
        this.phone = "";
        this.companyDescription = "";
        this.serviceDescription = "";
        this.briefCompanyDescription = "";
        this.briefServiceDescription = "";
        this.preferExplanation = "";
    }

    public CompanyInformationDTO(int id, String address, String phone, String companydescription, String servicedescription, String briefcompanydescription, String briefservicedescription, String preferExplanation) {
        this.iD = id;
        this.address = address;
        this.phone = phone;
        this.companyDescription = companydescription;
        this.serviceDescription = servicedescription;
        this.briefCompanyDescription = briefcompanydescription;
        this.briefServiceDescription = briefservicedescription;
        this.preferExplanation = preferExplanation;
    }

    public int getID() {
        return this.iD;
    }

    public void setID(int iD) {
        this.iD = iD;
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

    public String getCompanyDescription() {
        return this.companyDescription;
    }

    public void setCompanyDescription(String companyDescription) {
        this.companyDescription = companyDescription;
    }

    public String getServiceDescription() {
        return this.serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }

    public String getBriefCompanyDescription() {
        return this.briefCompanyDescription;
    }

    public void setBriefCompanyDescription(String briefCompanyDescription) {
        this.briefCompanyDescription = briefCompanyDescription;
    }

    public String getBriefServiceDescription() {
        return this.briefServiceDescription;
    }

    public void setBriefServiceDescription(String briefServiceDescription) {
        this.briefServiceDescription = briefServiceDescription;
    }

    /**
     * @return the preferExplanation
     */
    public String getPreferExplanation() {
        return preferExplanation;
    }

    /**
     * @param preferExplanation the preferExplanation to set
     */
    public void setPreferExplanation(String preferExplanation) {
        this.preferExplanation = preferExplanation;
    }
}
