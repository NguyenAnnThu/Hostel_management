package com.example.case_study.entity;

public class RoomAssets {
    private int id;
    private String roomId;
    private String assetCode;
    private int quantity;

    public RoomAssets() {
    }

    public RoomAssets(int id, String roomId, String assetCode, int quantity) {
        this.id = id;
        this.roomId = roomId;
        this.assetCode = assetCode;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
