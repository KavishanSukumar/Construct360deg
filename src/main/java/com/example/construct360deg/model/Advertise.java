package com.example.construct360deg.model;

import java.io.InputStream;
import java.sql.Blob;

public class Advertise {
    private String addid;
    private int userid;
    private String weburl;
    private String headline;
    private String description;
    private InputStream img;
    private Blob imgblob;

    public Blob getImgblob() {
        return imgblob;
    }

    public void setImgblob(Blob imgblob) {
        this.imgblob = imgblob;
    }

    public Byte[] getImgbyte() {
        return imgbyte;
    }

    public void setImgbyte(Byte[] imgbyte) {
        this.imgbyte = imgbyte;
    }

    private Byte[] imgbyte;

    public String getAddid() {
        return addid;
    }

    public void setAddid(String addid) {
        this.addid = addid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getWeburl() {
        return weburl;
    }

    public void setWeburl(String weburl) {
        this.weburl = weburl;
    }

    public String getHeadline() {
        return headline;
    }

    public void setHeadline(String headline) {
        this.headline = headline;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public InputStream getImg() {
        return img;
    }

    public void setImg(InputStream img) {
        this.img = img;
    }


}
