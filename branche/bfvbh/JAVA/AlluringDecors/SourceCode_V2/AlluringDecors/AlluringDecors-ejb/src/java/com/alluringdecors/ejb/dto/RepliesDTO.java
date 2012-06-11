package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with Replies table in database
public class RepliesDTO implements Serializable {

    private int iD;
    private int iDFeedBack;
    private String replyContent;
    private String replyName;
    private Date replyDate;

    public RepliesDTO() {
        this.iD = 0;
        this.iDFeedBack = 0;
        this.replyContent = "";
        this.replyName = "";
        this.replyDate = new Date();
    }

    public RepliesDTO(int id, int idfeedback, String replycontent, String replyname, Date replydate) {
        this.iD = id;
        this.iDFeedBack = idfeedback;
        this.replyContent = replycontent;
        this.replyName = replyname;
        this.replyDate = replydate;
    }

    public int getID() {
        return this.iD;
    }

    public void setID(int iD) {
        this.iD = iD;
    }

    public int getIDFeedBack() {
        return this.iDFeedBack;
    }

    public void setIDFeedBack(int iDFeedBack) {
        this.iDFeedBack = iDFeedBack;
    }

    public String getReplyContent() {
        return this.replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getReplyName() {
        return this.replyName;
    }

    public void setReplyName(String replyName) {
        this.replyName = replyName;
    }

    public Date getReplyDate() {
        return this.replyDate;
    }

    public void setReplyDate(Date replyDate) {
        this.replyDate = replyDate;
    }
}
