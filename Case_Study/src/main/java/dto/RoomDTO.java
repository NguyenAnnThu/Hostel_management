package dto;

import java.util.Date;

public class RoomDTO {
    private String roomID;
    private int floor;
    private float area;
    private double price;
    private String status;
    private String tenantName;
    private Date updatedAt;

    public RoomDTO() {
    }

    public RoomDTO(String roomID, int floor, float area, double price, String status, String tenantName, Date updatedAt) {
        this.roomID = roomID;
        this.floor = floor;
        this.area = area;
        this.price = price;
        this.status = status;
        this.tenantName = tenantName;
        this.updatedAt = updatedAt;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "RoomDTO{" +
                "roomID='" + roomID + '\'' +
                ", floor=" + floor +
                ", area=" + area +
                ", price=" + price +
                ", status='" + status + '\'' +
                ", tenantName='" + tenantName + '\'' +
                ", updatedAt=" + updatedAt +
                '}';
    }
}
