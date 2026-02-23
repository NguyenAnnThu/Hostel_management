package com.example.case_study.dto;

import java.util.Date;

public class RoomDTO {
    private String roomId;
    private int floor;
    private double area;
    private double price;
    private int maxOccupants;
    private String description;
    private String status;
    private String image;
    private Date createdAt;
    private Date updatedAt;
    private String tenantName;

    public RoomDTO() {
    }

    public RoomDTO(String roomId, int floor, double area, double price, int maxOccupants, String description, String status, String image, Date createdAt, Date updatedAt, String tenantName) {
        this.roomId = roomId;
        this.floor = floor;
        this.area = area;
        this.price = price;
        this.maxOccupants = maxOccupants;
        this.description = description;
        this.status = status;
        this.image = image;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.tenantName = tenantName;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getMaxOccupants() {
        return maxOccupants;
    }

    public void setMaxOccupants(int maxOccupants) {
        this.maxOccupants = maxOccupants;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }
}
