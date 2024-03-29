package com.example.construct360deg.model;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;

public class Requirement {

    private String cusname;
    private String custype;
    private byte[] cusprofimg;
    private int requirementid;
    private int useridcus;
    private int profid;
    private String reqname;
    private String description;
    private String type;
    private String contactnum;
    private byte[] requirementfile;
    private String filename;
    private String street;
    private String city;
    private String district;
    private String province;
    private InputStream requirementstream;
    private Date req_upload_date;
    private Time req_upload_time;
    private int display_on_prof;
    private Date req_recived_date;
    private int accept;
    private int reject;

    public int getDeletereq() {
        return deletereq;
    }

    public void setDeletereq(int deletereq) {
        this.deletereq = deletereq;
    }

    private int deletereq;

    public int getAccept() {
        return accept;
    }

    public void setAccept(int accept) {
        this.accept = accept;
    }

    public int getReject() {
        return reject;
    }

    public void setReject(int reject) {
        this.reject = reject;
    }


    public Date getReq_recived_date() {
        return req_recived_date;
    }

    public void setReq_recived_date(Date req_recived_date) {
        this.req_recived_date = req_recived_date;
    }



    public int getProfid() {
        return profid;
    }

    public void setProfid(int profid) {
        this.profid = profid;
    }

    public String getCusname() {
        return cusname;
    }

    public void setCusname(String cusname) {
        this.cusname = cusname;
    }

    public String getCustype() {
        return custype;
    }

    public void setCustype(String custype) {
        this.custype = custype;
    }

    public byte[] getCusprofimg() {
        return cusprofimg;
    }

    public void setCusprofimg(byte[] cusprofimg) {
        this.cusprofimg = cusprofimg;
    }



    public int getDisplay_on_prof() {
        return display_on_prof;
    }

    public void setDisplay_on_prof(int display_on_prof) {
        this.display_on_prof = display_on_prof;
    }



    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Date getReq_upload_date() {
        return req_upload_date;
    }

    public void setReq_upload_date(Date req_upload_date) {
        this.req_upload_date = req_upload_date;
    }

    public Time getReq_upload_time() {
        return req_upload_time;
    }

    public void setReq_upload_time(Time req_upload_time) {
        this.req_upload_time = req_upload_time;
    }


    public String getReqname() {
        return reqname;
    }

    public void setReqname(String reqname) {
        this.reqname = reqname;
    }

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
