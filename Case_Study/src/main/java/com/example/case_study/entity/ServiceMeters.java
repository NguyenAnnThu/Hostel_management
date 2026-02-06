package com.example.case_study.entity;

import java.util.Date;

public class ServiceMeters {
    private int meterId;
    private String roomId;
    private String serviceCode;
    private int month;
    private int year;
    private int oldValue;
    private int newValue;
    private Date recordDate;

    public ServiceMeters() {
    }

    public ServiceMeters(int meterId, String roomId, String serviceCode, int month, int year, int oldValue, int newValue, Date recordDate) {
        this.meterId = meterId;
        this.roomId = roomId;
        this.serviceCode = serviceCode;
        this.month = month;
        this.year = year;
        this.oldValue = oldValue;
        this.newValue = newValue;
        this.recordDate = recordDate;
    }

    public int getMeterId() {
        return meterId;
    }

    public void setMeterId(int meterId) {
        this.meterId = meterId;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getOldValue() {
        return oldValue;
    }

    public void setOldValue(int oldValue) {
        this.oldValue = oldValue;
    }

    public int getNewValue() {
        return newValue;
    }

    public void setNewValue(int newValue) {
        this.newValue = newValue;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }
}
