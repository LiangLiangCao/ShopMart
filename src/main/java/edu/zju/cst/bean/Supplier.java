package edu.zju.cst.bean;

import java.util.Date;

public class Supplier {
    private Long suplrId;

    private String suplyrName;

    private String address;

    private String phone;

    private String type;

    private String postcode;

    private Date registerTime;

    private String password;

    private String suplyName;

    public Supplier(Long suplrId, String suplyrName, String address, String phone, String type, String postcode, Date registerTime, String password, String suplyName) {
        this.suplrId = suplrId;
        this.suplyrName = suplyrName;
        this.address = address;
        this.phone = phone;
        this.type = type;
        this.postcode = postcode;
        this.registerTime = registerTime;
        this.password = password;
        this.suplyName = suplyName;
    }

    public Supplier() {
        super();
    }

    public Long getSuplrId() {
        return suplrId;
    }

    public void setSuplrId(Long suplrId) {
        this.suplrId = suplrId;
    }

    public String getSuplyrName() {
        return suplyrName;
    }

    public void setSuplyrName(String suplyrName) {
        this.suplyrName = suplyrName == null ? null : suplyrName.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSuplyName() {
        return suplyName;
    }

    public void setSuplyName(String suplyName) {
        this.suplyName = suplyName == null ? null : suplyName.trim();
    }
}