package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with FeedBacks table in database
public class FeedBacksDTO implements Serializable {

    private int iD;
    private String tiitle;
    private String content;
    private String fullName;
    private String email;
    private Date postDate;
    private boolean isReplied;

    public FeedBacksDTO() {
        this.iD = 0;
        this.tiitle = "";
        this.content = "";
        this.fullName = "";
        this.email = "";
        this.postDate = new Date();
        this.isReplied = false;
    }

    public FeedBacksDTO(int id, String tiitle, String content, String fullname, String email, Date postdate, boolean isreplied) {
        this.iD = id;
        this.tiitle = tiitle;
        this.content = content;
        this.fullName = fullname;
        this.email = email;
        this.postDate = postdate;
        this.isReplied = isreplied;
    }

    public int getID() {
        return this.iD;
    }

    public void setID(int iD) {
        this.iD = iD;
    }

    public String getTiitle() {
        return this.tiitle;
    }

    public void setTiitle(String tiitle) {
        this.tiitle = tiitle;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFullName() {
        return this.fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getPostDate() {
        return this.postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public boolean getIsReplied() {
        return this.isReplied;
    }

    public void setIsReplied(boolean isReplied) {
        this.isReplied = isReplied;
    }
}
