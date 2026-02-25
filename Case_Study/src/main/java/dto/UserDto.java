package dto;

import java.util.Date;

public class UserDto {
    private String userId;
    private String fullName;
    private String phone;
    private String email;
    private String citizenId;
    private String address;
    private Date dateOfBirth;
    private String status;
    private String role;
    private String password;

    public UserDto() {
    }

    public UserDto(String userId, String fullName, String phone, String email, String citizenId, String address, Date dateOfBirth, String status) {
        this.userId = userId;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.citizenId = citizenId;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.status = status;
    }
    public UserDto(String userId, String fullName, String phone, String email, String citizenId, String address, Date dateOfBirth, String status, String role,  String password) {
        this.userId = userId;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.citizenId = citizenId;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.status = status;
        this.password = password;
        this.role = role;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCitizenId() {
        return citizenId;
    }

    public void setCitizenId(String citizenId) {
        this.citizenId = citizenId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
