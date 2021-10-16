package com.example.construct360deg.model;

import java.sql.Blob;

public class AllUsers {
    private  int userid;
    private  Blob profilepic;
    private  String profcompanyname;
    private  String Proffullname;
    private  String custcompanyname;
    private  String cusfullname;
    private  boolean comlandflag;
    private  boolean comcontractflag;
    private  boolean productcompflag;
    private  boolean indivlandflag;
    private  boolean indivcontractflag;
    private byte[] imgbytes;

    public byte[] getImgbytes() {
        return imgbytes;
    }

    public void setImgbytes(byte[] imgbytes) {
        this.imgbytes = imgbytes;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Blob getProfilepic() {
        return profilepic;
    }

    public void setProfilepic(Blob profilepic) {
        this.profilepic = profilepic;
    }

    public String getProfcompanyname() {
        return profcompanyname;
    }

    public void setProfcompanyname(String profcompanyname) {
        this.profcompanyname = profcompanyname;
    }

    public String getProffullname() {
        return Proffullname;
    }

    public void setProffullname(String proffullname) {
        Proffullname = proffullname;
    }

    public String getCustcompanyname() {
        return custcompanyname;
    }

    public void setCustcompanyname(String custcompanyname) {
        this.custcompanyname = custcompanyname;
    }

    public String getCusfullname() {
        return cusfullname;
    }

    public void setCusfullname(String cusfullname) {
        this.cusfullname = cusfullname;
    }

    public boolean isComlandflag() {
        return comlandflag;
    }

    public void setComlandflag(boolean comlandflag) {
        this.comlandflag = comlandflag;
    }

    public boolean isComcontractflag() {
        return comcontractflag;
    }

    public void setComcontractflag(boolean comcontractflag) {
        this.comcontractflag = comcontractflag;
    }

    public boolean isProductcompflag() {
        return productcompflag;
    }

    public void setProductcompflag(boolean productcompflag) {
        this.productcompflag = productcompflag;
    }

    public boolean isIndivlandflag() {
        return indivlandflag;
    }

    public void setIndivlandflag(boolean indivlandflag) {
        this.indivlandflag = indivlandflag;
    }

    public boolean isIndivcontractflag() {
        return indivcontractflag;
    }

    public void setIndivcontractflag(boolean indivcontractflag) {
        this.indivcontractflag = indivcontractflag;
    }
}
