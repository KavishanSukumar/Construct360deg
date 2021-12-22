package com.example.construct360deg.model;




import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;

public class Advertise {
    private String addid;
    private int userid;
    private String weburl;
    private String headline;
    private String description;
    private InputStream img;
    private Blob imgblob;
    private Date todaydate;
    private Time nowtime;
    private String username;
    private String role;
    private Date evodate;
    private String addstatus;


    public Date getEvodate() {
        return evodate;
    }

    public void setEvodate(Date evodate) {
        this.evodate = evodate;
    }

    public String getAddstatus() {
        return addstatus;
    }

    public void setAddstatus(String addstatus) {
        this.addstatus = addstatus;
    }



    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }




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

    public Blob getImgblob() {
        return imgblob;
    }

    public void setImgblob(Blob imgblob) {
        this.imgblob = imgblob;
    }

    public Date getTodaydate() {
        return todaydate;
    }

    public void setTodaydate(Date todaydate) {
        this.todaydate = todaydate;
    }

    public Time getNowtime() {
        return nowtime;
    }

    public void setNowtime(Time nowtime) {
        this.nowtime = nowtime;
    }



}
