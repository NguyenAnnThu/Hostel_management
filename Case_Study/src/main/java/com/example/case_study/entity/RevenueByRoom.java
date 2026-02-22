package com.example.case_study.entity;

public class RevenueByRoom {
    private String roomId;
    private double revenue;

    public RevenueByRoom(String roomId, double revenue) {
        this.roomId = roomId;
        this.revenue = revenue;
    }

    public RevenueByRoom(){

    }
    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
}
