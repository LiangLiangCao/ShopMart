package edu.zju.cst.bean;

public class User {
    private Long uid;

    private String password;

    private String gender;

    private String email;

    private String phone;

    private String role;

    private Long score;

    public User(Long uid, String password, String gender, String email, String phone, Long score, String role) {
        this.uid = uid;
        this.password = password;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.score = score;
    }

    public User() {
        super();
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    public Long getScore() {
        return score;
    }

    public void setScore(Long score) {
        this.score = score;
    }
}