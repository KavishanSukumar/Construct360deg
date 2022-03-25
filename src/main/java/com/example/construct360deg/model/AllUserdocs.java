package com.example.construct360deg.model;

import java.io.InputStream;
import java.sql.Date;

public class AllUserdocs {
    private int doc_id;
    private int userid;
    private String user_role;
    private String doc_name;
    private byte[] document;
    private InputStream documentfile;
    private int verified;
    private Date uploaded_date;
    private int tag;

    public int getDoc_id() {
        return doc_id;
    }

    public InputStream getDocumentfile() {
        return documentfile;
    }

    public void setDocumentfile(InputStream documentfile) {
        this.documentfile = documentfile;
    }

    public void setDoc_id(int doc_id) {
        this.doc_id = doc_id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUser_role() {
        return user_role;
    }

    public void setUser_role(String user_role) {
        this.user_role = user_role;
    }

    public String getDoc_name() {
        return doc_name;
    }

    public void setDoc_name(String doc_name) {
        this.doc_name = doc_name;
    }

    public byte[] getDocument() {
        return document;
    }

    public void setDocument(byte[] document) {
        this.document = document;
    }

    public int getVerified() {
        return verified;
    }

    public void setVerified(int verified) {
        this.verified = verified;
    }

    public Date getUploaded_date() {
        return uploaded_date;
    }

    public void setUploaded_date(Date uploaded_date) {
        this.uploaded_date = uploaded_date;
    }

    public int getTag() {
        return tag;
    }

    public void setTag(int tag) {
        this.tag = tag;
    }
}
