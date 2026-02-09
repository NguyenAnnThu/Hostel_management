package com.example.case_study.entity;

public class Services {
    private String serviceCode;
    private String serviceName;
    private String serviceType;
    private String unit;
    private double defaultPrice;
    private String status;

    public Services() {
    }

    public Services(String serviceCode, String serviceName, String serviceType, String unit, double defaultPrice, String status) {
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
        this.serviceType = serviceType;
        this.unit = unit;
        this.defaultPrice = defaultPrice;
        this.status = status;
    }

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public double getDefaultPrice() {
        return defaultPrice;
    }

    public void setDefaultPrice(double defaultPrice) {
        this.defaultPrice = defaultPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
