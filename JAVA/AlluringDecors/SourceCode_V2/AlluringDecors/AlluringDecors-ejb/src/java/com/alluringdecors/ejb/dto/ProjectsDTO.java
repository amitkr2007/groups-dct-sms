package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with Projects table in database
public class ProjectsDTO implements Serializable {

    private int iD;
    private int iDServiceRequest;
    private String projectStatus;
    private String name;
    private String image;
    private String description;
    private String briefDescription;
    private Date startDate;

    public ProjectsDTO() {
        this.iD = 0;
        this.iDServiceRequest = 0;
        this.projectStatus = "On-Going";
        this.name = "";
        this.image = "";
        this.description = "";
        this.briefDescription = "";
        this.startDate = new Date();
    }

    public ProjectsDTO(int id, int idservicerequest, String projectstatus, String name, String image, String description, String briefdescription, Date startdate) {
        this.iD = id;
        this.iDServiceRequest = idservicerequest;
        this.projectStatus = projectstatus;
        this.name = name;
        this.image = image;
        this.description = description;
        this.briefDescription = briefdescription;
        this.startDate = startdate;
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

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public Date getStartDate() {
        return this.startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the projectStatus
     */
    public String getProjectStatus() {
        return projectStatus;
    }

    /**
     * @param projectStatus the projectStatus to set
     */
    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }
}
