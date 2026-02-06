package com.example.case_study.entity;

import java.util.Date;

public class PaymentConfirmations {
    private int confirmationId;
    private int invoiceId;
    private String confirmedBy;
    private Date confirmedAt;
    private String note;

    public PaymentConfirmations() {
    }

    public PaymentConfirmations(int confirmationId, int invoiceId, String confirmedBy, Date confirmedAt, String note) {
        this.confirmationId = confirmationId;
        this.invoiceId = invoiceId;
        this.confirmedBy = confirmedBy;
        this.confirmedAt = confirmedAt;
        this.note = note;
    }

    public int getConfirmationId() {
        return confirmationId;
    }

    public void setConfirmationId(int confirmationId) {
        this.confirmationId = confirmationId;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getConfirmedBy() {
        return confirmedBy;
    }

    public void setConfirmedBy(String confirmedBy) {
        this.confirmedBy = confirmedBy;
    }

    public Date getConfirmedAt() {
        return confirmedAt;
    }

    public void setConfirmedAt(Date confirmedAt) {
        this.confirmedAt = confirmedAt;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
