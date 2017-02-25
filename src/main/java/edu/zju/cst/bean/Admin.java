package edu.zju.cst.bean;

public class Admin {
    private String adminName;

    private String password;

    public Admin(String adminName, String password) {
        this.adminName = adminName;
        this.password = password;
    }

    public Admin() {
        super();
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}