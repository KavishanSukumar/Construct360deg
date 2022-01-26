package com.example.construct360deg.model;

public class Chat {
    private int sender;
    private int receiver;
    private String datetime;
    private String message;
    private String customerindividualName;
    private String customercomname;
    private String individualprof;
    private String professionalname;

    public String getCustomerindividualName() {
        return customerindividualName;
    }

    public void setCustomerindividualName(String customerindividualName) {
        this.customerindividualName = customerindividualName;
    }

    public String getCustomercomname() {
        return customercomname;
    }

    public void setCustomercomname(String customercomname) {
        this.customercomname = customercomname;
    }

    public String getIndividualprof() {
        return individualprof;
    }

    public void setIndividualprof(String individualprof) {
        this.individualprof = individualprof;
    }

    public String getProfessionalname() {
        return professionalname;
    }

    public void setProfessionalname(String professionalname) {
        this.professionalname = professionalname;
    }

    public int getSender() {
        return sender;
    }

    public void setSender(int sender) {
        this.sender = sender;
    }

    public int getReceiver() {
        return receiver;
    }

    public void setReceiver(int receiver) {
        this.receiver = receiver;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
