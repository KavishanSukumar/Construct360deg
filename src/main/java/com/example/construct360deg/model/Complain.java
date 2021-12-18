package com.example.construct360deg.model;

public class Complain {
    private int complainid;
    private int complainer;
    private int complainee;
    private String fullname;
    private String email;
    private String category;
    private String message;

    public int getComplainid() {
        return complainid;
    }

    public void setComplainid(int complainid) {
        this.complainid = complainid;
    }

    public int getComplainer() {
        return complainer;
    }

    public void setComplainer(int complainer) {
        this.complainer = complainer;
    }

    public int getComplainee() {
        return complainee;
    }

    public void setComplainee(int complainee) {
        this.complainee = complainee;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
