package com.example.case_study.entity;

import java.util.Date;

public class ServicePriceConfig {
    private int configId;
    private String serviceCode;
    private double price;
    private Date effectiveDate;

    public ServicePriceConfig() {
    }

    public ServicePriceConfig(int configId, String serviceCode, double price, Date effectiveDate) {
        this.configId = configId;
        this.serviceCode = serviceCode;
        this.price = price;
        this.effectiveDate = effectiveDate;
    }

    public int getConfigId() {
        return configId;
    }

    public void setConfigId(int configId) {
        this.configId = configId;
    }

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }
}
