package com.example.construct360deg.model;

import java.io.InputStream;
import java.sql.Blob;

public class Requirement {
    private int requirementid;
    private int useridcus;
    private String description;
    private String type;
    private String contactnum;
    private byte[] requirementfile;
    private String street;
    private String city;
    private String district;
    private String province;
    private InputStream requirementstream;

    public int getRequirementid() {
        return requirementid;
    }

    public void setRequirementid(int requirementid) {
        this.requirementid = requirementid;
    }

    public int getUseridcus() {
        return useridcus;
    }

    public void setUseridcus(int useridcus) {
        this.useridcus = useridcus;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContactnum() {
        return contactnum;
    }

    public void setContactnum(String contactnum) {
        this.contactnum = contactnum;
    }

    public byte[] getRequirementfile() {
        return requirementfile;
    }

    public void setRequirementfile(byte[] requirementfile) {
        this.requirementfile = requirementfile;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public InputStream getRequirementstream() {
        return requirementstream;
    }

    public void setRequirementstream(InputStream requirementstream) {
        this.requirementstream = requirementstream;
    }
}
