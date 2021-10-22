package com.example.construct360deg.model;

import java.io.InputStream;
import java.sql.Blob;

public class PreviousProject {
    private  String projectid;
    private  int userid;
    private  String customerfeedback;
    private  String province;
    private  String district;
    private  String city;
    private  String street;
    private  String houseno;
    private  int noofstars;
    private  int imageid;
    private InputStream image;
    private  String referancecontactno;
    private  String referenceemail;
    private  String referencename;
    private byte[] imgBytes;

    public byte[] getImgBytes() {
        return imgBytes;
    }

    public void setImgBytes(byte[] imgBytes) {
        this.imgBytes = imgBytes;
    }

    public String getProjectid() {
        return projectid;
    }

    public void setProjectid(String projectid) {
        this.projectid = projectid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getCustomerfeedback() {
        return customerfeedback;
    }

    public void setCustomerfeedback(String customerfeedback) {
        this.customerfeedback = customerfeedback;
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

    public int getNoofstars() {
        return noofstars;
    }

    public void setNoofstars(int noofstars) {
        this.noofstars = noofstars;
    }

    public int getImageid() {
        return imageid;
    }

    public void setImageid(int imageid) {
        this.imageid = imageid;
    }

    public InputStream getImage() {
        return image;
    }

    public void setImage(InputStream image) {
        this.image = image;
    }

    public String getReferancecontactno() {
        return referancecontactno;
    }

    public void setReferancecontactno(String referancecontactno) {
        this.referancecontactno = referancecontactno;
    }

    public String getReferenceemail() {
        return referenceemail;
    }

    public void setReferenceemail(String referenceemail) {
        this.referenceemail = referenceemail;
    }

    public String getReferencename() {
        return referencename;
    }

    public void setReferencename(String referencename) {
        this.referencename = referencename;
    }
}
