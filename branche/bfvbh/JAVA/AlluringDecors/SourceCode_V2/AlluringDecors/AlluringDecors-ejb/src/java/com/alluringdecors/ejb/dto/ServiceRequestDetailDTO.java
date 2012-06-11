package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with ServiceRequestDetail table in database
public class ServiceRequestDetailDTO implements Serializable {

    private int iD;
    private int iDServiceRequest;
    private int iDServiceOffered;
    private int quantity;
    private double price;
    private String locationRequest;
    private ServicesOfferedDTO serviceOffered;

    public ServiceRequestDetailDTO() {
        this.iD = 0;
        this.iDServiceRequest = 0;
        this.iDServiceOffered = 0;
        this.quantity = 0;
        this.price = 0;
        this.locationRequest = "";
    }

    public ServiceRequestDetailDTO(int id, int idservicerequest, int idserviceoffered, int quantity, double price, String locationrequest) {
        this.iD = id;
        this.iDServiceRequest = idservicerequest;
        this.iDServiceOffered = idserviceoffered;
        this.quantity = quantity;
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

    public int getQuantity() {
        return this.quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    /**
     * @return the serviceOffered
     */
    public ServicesOfferedDTO getServiceOffered() {
        return serviceOffered;
    }

    /**
     * @param serviceOffered the serviceOffered to set
     */
    public void setServiceOffered(ServicesOfferedDTO serviceOffered) {
        this.serviceOffered = serviceOffered;
    }
}
