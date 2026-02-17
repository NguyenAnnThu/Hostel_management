package com.example.case_study.entity;

public class Account {
    private String phone;
    private String password;
    private String role;
    private  User user;
    public Account() {
    }

    public Account(String phone, String password, String role) {
        this.phone = phone;
        this.password = password;
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
