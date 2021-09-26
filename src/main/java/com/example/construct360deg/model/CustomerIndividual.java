package com.example.construct360deg.model;

import java.io.FileInputStream;
import java.util.Date;

public class CustomerIndividual {

            private int userid;
            private String firstname;
            private String lastname;
            private String username;
            private String password;
            private Date dob;
            private String email;
            private FileInputStream profilepic;
            private String province;
            private String district;
            private String city;
            private String street;
            private String houseno;
            private long  nic;
            private FileInputStream nicsoft;
            private String horrific;
            private String contactNo;
            private FileInputStream addressproof;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public java.sql.Date getDob() {
        return (java.sql.Date) dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public FileInputStream getProfilepic() {
        return profilepic;
    }

    public void setProfilepic(FileInputStream profilepic) {
        this.profilepic = profilepic;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouseno() {
        return houseno;
    }

    public void setHouseno(String houseno) {
        this.houseno = houseno;
    }

    public long getNic() {
        return nic;
    }

    public void setNic(long nic) {
        this.nic = nic;
    }

    public FileInputStream getNicsoft() {
        return nicsoft;
    }

    public void setNicsoft(FileInputStream nicsoft) {
        this.nicsoft = nicsoft;
    }

    public String getHorrific() {
        return horrific;
    }

    public void setHorrific(String horrific) {
        this.horrific = horrific;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public FileInputStream getAddressproof() {
        return addressproof;
    }

    public void setAddressproof(FileInputStream addressproof) {
        this.addressproof = addressproof;
    }
}
