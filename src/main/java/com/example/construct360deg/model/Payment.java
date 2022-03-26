package com.example.construct360deg.model;

import java.io.InputStream;

public class Payment {
    private int projectid;
    private int paymentid;
    private String paymentName;
    private String paymentdatetime;
    private InputStream image;
    private byte[] imagebyte;

    public int getProjectid() {
        return projectid;
    }

    public void setProjectid(int projectid) {
        this.projectid = projectid;
    }

    public int getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(int paymentid) {
        this.paymentid = paymentid;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public String getPaymentdatetime() {
        return paymentdatetime;
    }

    public void setPaymentdatetime(String paymentdatetime) {
        this.paymentdatetime = paymentdatetime;
    }

    public InputStream getImage() {
        return image;
    }

    public void setImage(InputStream image) {
        this.image = image;
    }

    public byte[] getImagebyte() {
        return imagebyte;
    }

    public void setImagebyte(byte[] imagebyte) {
        this.imagebyte = imagebyte;
    }
}
