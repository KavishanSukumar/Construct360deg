package com.example.construct360deg.model;

import javax.servlet.http.Part;
import java.io.InputStream;

public class Product {

    private String productName;
    private float quantity;
    private float price;
    private int companyid;
    private int productid;
    private InputStream productimage;
    private String productdes;

    public int getCompanyid() {
        return companyid;
    }

    public InputStream getProductimage() {
        return productimage;
    }
    public void setProductimage(InputStream productimage) {
        this.productimage = productimage;
    }
    public void setCompanyid(int companyid) {
        this.companyid = companyid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public String getProductdes() {
        return productdes;
    }

    public void setProductdes(String productdes) {
        this.productdes = productdes;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getQuantity() {
        return quantity;
    }

    public void setQuantity(float quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
