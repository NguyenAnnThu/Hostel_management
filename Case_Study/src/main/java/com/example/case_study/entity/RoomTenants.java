package com.example.case_study.entity;

import java.util.Date;

public class RoomTenants {
    private int id;
    private String userId;
    private String roomId;
    private String role;
    private Date moveInDate;
    private Date moveOutDate;
    private String status;
    private String note;

    public RoomTenants() {
    }

    public RoomTenants(int id, String userId, String roomId, String role, Date moveInDate, Date moveOutDate, String status, String note) {
        this.id = id;
        this.userId = userId;
        this.roomId = roomId;
        this.role = role;
        this.moveInDate = moveInDate;
        this.moveOutDate = moveOutDate;
        this.status = status;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getMoveInDate() {
        return moveInDate;
    }

    public void setMoveInDate(Date moveInDate) {
        this.moveInDate = moveInDate;
    }

    public Date getMoveOutDate() {
        return moveOutDate;
    }

    public void setMoveOutDate(Date moveOutDate) {
        this.moveOutDate = moveOutDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
