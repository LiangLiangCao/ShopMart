package edu.zju.cst.bean;

public class User {
    private Long userId;

    private String password;

    private String gender;

    private String email;

    private String phone;

    private String role;

    private Long score;

    private Integer isDelete;

    public User(Long userId, String password, String gender, String email, String phone, String role, Long score, Integer isDelete) {
        this.userId = userId;
        this.password = password;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.score = score;
        this.isDelete = isDelete;
    }

    public User() {
        super();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}