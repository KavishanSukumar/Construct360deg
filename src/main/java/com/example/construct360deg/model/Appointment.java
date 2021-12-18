package com.example.construct360deg.model;

public class Appointment {
    private int appoinmentid;
    private int customerid;
    private int profid;
    private String time;
    private String date;
    private String caption;
    private String message;

    public int getAppoinmentid() {
        return appoinmentid;
    }

    public void setAppoinmentid(int appoinmentid) {
        this.appoinmentid = appoinmentid;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public int getProfid() {
        return profid;
    }

    public void setProfid(int profid) {
        this.profid = profid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
