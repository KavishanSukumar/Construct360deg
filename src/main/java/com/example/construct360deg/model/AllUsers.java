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
    private boolean customercomflag;
    private boolean customerindivflag;
    private boolean productcomflag;
    private Blob addressproof;
    private byte[] addressproofbytes;
    private String province;
    private String district;
    private String city;
    private String street;
    private String houseno;
    private String contactnum;
    private String email;

    public Blob getAddressproof() {
        return addressproof;
    }

    public void setAddressproof(Blob addressproof) {
        this.addressproof = addressproof;
    }

    public byte[] getAddressproofbytes() {
        return addressproofbytes;
    }

    public void setAddressproofbytes(byte[] addressproofbytes) {
        this.addressproofbytes = addressproofbytes;
    }

    public String getContactnum() {
        return contactnum;
    }

    public void setContactnum(String contactnum) {
        this.contactnum = contactnum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public boolean isCustomercomflag() {
        return customercomflag;
    }

    public void setCustomercomflag(boolean customercomflag) {
        this.customercomflag = customercomflag;
    }

    public boolean isCustomerindivflag() {
        return customerindivflag;
    }

    public void setCustomerindivflag(boolean customerindivflag) {
        this.customerindivflag = customerindivflag;
    }

    public boolean isProductcomflag() {
        return productcomflag;
    }

    public void setProductcomflag(boolean productcomflag) {
        this.productcomflag = productcomflag;
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


/*
CREATE VIEW `alluserview`  AS
select `users`.`userid` AS `userid`,
`users`.`profilepic` AS `profilepic`,
`companyprof`.`companyname` AS `profcompanyname`,
`companyprof`.`landscapedesignerflag` AS `comlandflag`,
`companyprof`.`contractorflag` AS `comcontractflag`,
concat(`individualprof`.`firstname`,' ',`individualprof`.`lastname`) AS `Proffullname`,
`individualprof`.`landscapedesignerflag` AS `indivlandflag`,
`individualprof`.`contractorflag` AS `indivcontractflag`,
`productcompany`.`companyname` AS `productcomname`,
`customercompany`.`companyname` AS `cuscompanyname`,
concat(`customerindividual`.`firstname`,' ',`customerindividual`.`lastname`) AS `cusindfullname`,
users.province AS province,
users.district AS district,
users.city AS city,
users.street AS street,
users.houseno AS houseno,
usercontactno.contactno AS contactno,
usercontactno.email AS email
from ((((((`users` left join `companyprof` on(`users`.`userid` = `companyprof`.`userid`)) left join `individualprof` on(`users`.`userid` = `individualprof`.`userid`)) left join `customercompany` on(`users`.`userid` = `customercompany`.`userid`)) left join `customerindividual` on(`users`.`userid` = `customerindividual`.`userid`)) left join `productcompany` on(`users`.`userid` = `productcompany`.`userid`))left join `usercontactno` on(`users`.`userid` = `usercontactno`.`userid`)) ;
*/