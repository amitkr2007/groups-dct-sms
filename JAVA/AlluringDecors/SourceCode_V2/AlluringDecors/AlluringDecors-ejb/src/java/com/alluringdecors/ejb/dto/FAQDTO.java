package com.alluringdecors.ejb.dto;

import java.io.Serializable;
import java.util.Date;

// Data transfer object which is associated with FAQ table in database
public class FAQDTO implements Serializable {

    private int iD;
    private String question;
    private String answer;

    public FAQDTO() {
        this.iD = 0;
        this.question = "";
        this.answer = "";
    }

    public FAQDTO(int id, String question, String answer) {
        this.iD = id;
        this.question = question;
        this.answer = answer;
    }

    public int getID() {
        return this.iD;
    }

    public void setID(int iD) {
        this.iD = iD;
    }

    public String getQuestion() {
        return this.question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return this.answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
