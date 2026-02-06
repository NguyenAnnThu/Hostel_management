package com.example.case_study.entity;

import java.util.Date;

public class Bookings {
    private int bookingId;
    private String roomId;
    private String customerId;
    private Date bookingDate;
    private Date expireDate;
    private String status;

    public Bookings() {
    }

    public Bookings(int bookingId, String roomId, String customerId, Date bookingDate, Date expireDate, String status) {
        this.bookingId = bookingId;
        this.roomId = roomId;
        this.customerId = customerId;
        this.bookingDate = bookingDate;
        this.expireDate = expireDate;
        this.status = status;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
