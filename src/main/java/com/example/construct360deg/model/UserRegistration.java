package com.example.construct360deg.model;

public class UserRegistration {
    private String email;
    private String username;
    private String password;
    private String contactno;
    private String professionalrole;
    private  String Address;

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContactno() {
        return contactno;
    }

    public void setContactno(String contactno) {
        this.contactno = contactno;
    }

    public String getProfessionalrole() {
        return professionalrole;
    }

    public void setProfessionalrole(String professionalrole) {
        this.professionalrole = professionalrole;
    }
}
