package com.example.case_study.entity;

public class InvoiceDetails {
    private int invoiceDetailId;
    private int invoiceId;
    private String serviceCode;
    private int quantity;
    private Double unitPrice;

    public InvoiceDetails() {
    }

    public InvoiceDetails(int invoiceDetailId, int invoiceId, String serviceCode, int quantity, Double unitPrice) {
        this.invoiceDetailId = invoiceDetailId;
        this.invoiceId = invoiceId;
        this.serviceCode = serviceCode;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public int getInvoiceDetailId() {
        return invoiceDetailId;
    }

    public void setInvoiceDetailId(int invoiceDetailId) {
        this.invoiceDetailId = invoiceDetailId;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }
}
