package com.example.case_study.entity;

import java.util.Date;

public class Invoices {
    private int invoiceId;
    private String roomId;
    private String customerId;
    private int month;
    private int year;
    private String qrCode;
    private String status;
    private Date createdAt;

    public Invoices() {
    }

    public Invoices(int invoiceId, String roomId, String customerId, int month, int year, String qrCode, String status, Date createdAt) {
        this.invoiceId = invoiceId;
        this.roomId = roomId;
        this.customerId = customerId;
        this.month = month;
        this.year = year;
        this.qrCode = qrCode;
        this.status = status;
        this.createdAt = createdAt;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
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

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
