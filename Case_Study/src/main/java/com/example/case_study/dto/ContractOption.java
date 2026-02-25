package com.example.case_study.dto;

public class ContractOption {
    private int contractId;
    private String roomId;
    private String customerId;
    private String customerName;

    public ContractOption() {
    }

    public ContractOption(int contractId, String roomId, String customerId, String customerName) {
        this.contractId = contractId;
        this.roomId = roomId;
        this.customerId = customerId;
        this.customerName = customerName;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
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

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}
