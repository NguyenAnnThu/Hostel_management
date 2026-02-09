package com.example.case_study.repository;

import com.example.case_study.entity.Rooms;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RoomsRepository implements IRoomsRepository {

    private List<Rooms> roomsList;

    public RoomsRepository() {
        roomsList = new ArrayList<>();
    }

    // Lấy toàn bộ phòng
    @Override
    public List<Rooms> getAllRooms() {
        return roomsList;
    }

    // Thêm phòng mới
    @Override
    public boolean addRoom(Rooms room) {
        if (room == null) return false;

        if (findById(room.getRoomId()) != null) {
            return false; // trùng mã phòng
        }

        room.setCreatedAt(new Date());
        roomsList.add(room);
        return true;
    }

    // Cập nhật phòng
    @Override
    public boolean updateRoom(Rooms room) {
        Rooms existing = findById(room.getRoomId());
        if (existing == null) return false;

        existing.setFloor(room.getFloor());
        existing.setArea(room.getArea());
        existing.setPrice(room.getPrice());
        existing.setMaxOccupants(room.getMaxOccupants());
        existing.setDescription(room.getDescription());
        existing.setStatus(room.getStatus());
        existing.setUpdatedAt(new Date());
        return true;
    }

    // Xóa phòng
    @Override
    public boolean deleteRoom(String roomId) {
        return roomsList.removeIf(r -> r.getRoomId().equalsIgnoreCase(roomId));
    }

    // Tìm theo mã phòng
    @Override
    public Rooms findById(String roomId) {
        for (Rooms r : roomsList) {
            if (r.getRoomId().equalsIgnoreCase(roomId)) {
                return r;
            }
        }
        return null;
    }

    // Lọc theo trạng thái (AVAILABLE, OCCUPIED, MAINTENANCE...)
    @Override
    public List<Rooms> findByStatus(String status) {
        List<Rooms> result = new ArrayList<>();
        for (Rooms r : roomsList) {
            if (r.getStatus().equalsIgnoreCase(status)) {
                result.add(r);
            }
        }
        return result;
    }

    // Lọc theo tầng
    @Override
    public List<Rooms> findByFloor(int floor) {
        List<Rooms> result = new ArrayList<>();
        for (Rooms r : roomsList) {
            if (r.getFloor() == floor) {
                result.add(r);
            }
        }
        return result;
    }
}
