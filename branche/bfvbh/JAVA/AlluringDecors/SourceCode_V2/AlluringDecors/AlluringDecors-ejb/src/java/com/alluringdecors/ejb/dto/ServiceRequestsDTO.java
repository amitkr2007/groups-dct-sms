package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

// Data transfer object which is associated with ServiceRequests table in database
public class ServiceRequestsDTO implements Serializable {

    private int iD;
    private int iDUser;
    private String requestStatus;
    private Date requestDate;
    private String location;
    private String phoneLocation;
    private String mailLocation;
    private String note;
    private UserDTO user;
    private boolean projectCreated;
    private boolean billCreated;
    private List<ServiceRequestDetailDTO> serviceRequestDetail;
            
    public ServiceRequestsDTO() {
        this.iD = 0;
        this.iDUser = 0;
        this.requestStatus = "";
        this.requestDate = new Date();
        this.location = "";
        this.phoneLocation = "";
        this.mailLocation = "";
        this.note = "";
        serviceRequestDetail = new ArrayList<ServiceRequestDetailDTO>();
    }

    public ServiceRequestsDTO(int id, int iduser, String requeststatus, Date requestdate, String location, String phonelocation, String maillocation, String note) {
        this.iD = id;
        this.iDUser = iduser;
        this.requestStatus = requeststatus;
        this.requestDate = requestdate;
        this.location = location;
        this.phoneLocation = phonelocation;
        this.mailLocation = maillocation;
        this.note = note;
        serviceRequestDetail = new ArrayList<ServiceRequestDetailDTO>();
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

    public String getRequestStatus() {
        return this.requestStatus;
    }

    public void setRequestStatus(String requestStatus) {
        this.requestStatus = requestStatus;
    }

    public Date getRequestDate() {
        return this.requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public String getLocation() {
        return this.location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPhoneLocation() {
        return this.phoneLocation;
    }

    public void setPhoneLocation(String phoneLocation) {
        this.phoneLocation = phoneLocation;
    }

    public String getMailLocation() {
        return this.mailLocation;
    }

    public void setMailLocation(String mailLocation) {
        this.mailLocation = mailLocation;
    }

    public String getNote() {
        return this.note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    /**
     * @return the user
     */
    public UserDTO getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(UserDTO user) {
        this.user = user;
    }

    /**
     * @return the projectCreated
     */
    public boolean isProjectCreated() {
        return projectCreated;
    }

    /**
     * @param projectCreated the projectCreated to set
     */
    public void setProjectCreated(boolean projectCreated) {
        this.projectCreated = projectCreated;
    }

    /**
     * @return the serviceRequestDetail
     */
    public List<ServiceRequestDetailDTO> getServiceRequestDetail() {
        return serviceRequestDetail;
    }

    /**
     * @param serviceRequestDetail the serviceRequestDetail to set
     */
    public void setServiceRequestDetail(List<ServiceRequestDetailDTO> serviceRequestDetail) {
        this.serviceRequestDetail = serviceRequestDetail;
    }

    /**
     * @return the billCreated
     */
    public boolean isBillCreated() {
        return billCreated;
    }

    /**
     * @param billCreated the billCreated to set
     */
    public void setBillCreated(boolean billCreated) {
        this.billCreated = billCreated;
    }
}
