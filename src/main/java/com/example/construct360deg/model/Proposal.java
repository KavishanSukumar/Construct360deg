package com.example.construct360deg.model;

import java.io.InputStream;
import java.sql.Date;
import java.sql.Time;

public class Proposal {
    private String cusname;
    private String custype;
    private byte[] cusprofimg;

    public String getProfname() {
        return profname;
    }

    public void setProfname(String profname) {
        this.profname = profname;
    }

    public byte[] getProposal() {
        return proposal;
    }

    public void setProposal(byte[] proposal) {
        this.proposal = proposal;
    }

    private byte[] proposal;
    private String profname;
    private byte[] profprofimg;
    private int requirementid;
    private int proposalid;
    private int cusid;
    private int profid;
    private String reqname;
    private String description;
    private String type;
    private String contactnum;
    private InputStream proposalfile;
    private String filename;
    private Date proposal_upload_date;
    private Time proposal_upload_time;
    private int customeraccept;
    private int customerreject;

    public int getIsprojectcreated() {
        return isprojectcreated;
    }

    public void setIsprojectcreated(int isprojectcreated) {
        this.isprojectcreated = isprojectcreated;
    }

    private  int isprojectcreated;


    public byte[] getProfprofimg() {
        return profprofimg;
    }

    public void setProfprofimg(byte[] profprofimg) {
        this.profprofimg = profprofimg;
    }


    public int getCustomerreject() {
        return customerreject;
    }

    public void setCustomerreject(int customerreject) {
        this.customerreject = customerreject;
    }





    public InputStream getProposalfile() {
        return proposalfile;
    }

    public void setProposalfile(InputStream proposalfile) {
        this.proposalfile = proposalfile;
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

    public int getRequirementid() {
        return requirementid;
    }

    public void setRequirementid(int requirementid) {
        this.requirementid = requirementid;
    }

    public int getProposalid() {
        return proposalid;
    }

    public void setProposalid(int proposalid) {
        this.proposalid = proposalid;
    }

    public int getCusid() {
        return cusid;
    }

    public void setCusid(int cusid) {
        this.cusid = cusid;
    }

    public int getProfid() {
        return profid;
    }

    public void setProfid(int profid) {
        this.profid = profid;
    }

    public String getReqname() {
        return reqname;
    }

    public void setReqname(String reqname) {
        this.reqname = reqname;
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



    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Date getProposal_upload_date() {
        return proposal_upload_date;
    }

    public void setProposal_upload_date(Date proposal_upload_date) {
        this.proposal_upload_date = proposal_upload_date;
    }

    public Time getProposal_upload_time() {
        return proposal_upload_time;
    }

    public void setProposal_upload_time(Time proposal_upload_time) {
        this.proposal_upload_time = proposal_upload_time;
    }

    public int getCustomeraccept() {
        return customeraccept;
    }

    public void setCustomeraccept(int customeraccept) {
        this.customeraccept = customeraccept;
    }





}
