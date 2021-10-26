package com.example.construct360deg.model;

import java.sql.Blob;

public class AllUsers {
    private int userid;
    private Blob profilepic;
    private String profcompanyname;
    private boolean comlandflag;
    private boolean comcontractflag;
    private String Proffullname;
    private boolean indivlandflag;
    private boolean indivcontractflag;
    private String productcomname;
    private String cuscompanyname;
    private String cusindfullname;
    private byte[] imgbytes;

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

    public String getProffullname() {
        return Proffullname;
    }

    public void setProffullname(String proffullname) {
        Proffullname = proffullname;
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

    public String getProductcomname() {
        return productcomname;
    }

    public void setProductcomname(String productcomname) {
        this.productcomname = productcomname;
    }

    public String getCuscompanyname() {
        return cuscompanyname;
    }

    public void setCuscompanyname(String cuscompanyname) {
        this.cuscompanyname = cuscompanyname;
    }

    public String getCusindfullname() {
        return cusindfullname;
    }

    public void setCusindfullname(String cusindfullname) {
        this.cusindfullname = cusindfullname;
    }

    public byte[] getImgbytes() {
        return imgbytes;
    }

    public void setImgbytes(byte[] imgbytes) {
        this.imgbytes = imgbytes;
    }
}
