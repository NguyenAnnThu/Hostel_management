package com.example.case_study.repository;

import com.example.case_study.entity.Rooms;
import dto.RoomDTO;
import util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RoomsRepository implements IRoomsRepository {
    private static final String GET_ALL_ROOMS =
            "select r.room_id, r.floor, r.area, r.price, r.status, r.updated_at, u.full_name AS tenant_name " +
                    "from rooms r " +
                    "left join room_tenants rt " +
                    "on r.room_id = rt.room_id " +
                    "and rt.status = 'staying' " +
                    "left join users u " +
                    "on rt.user_id = u.user_id " +
                    "where 1 = 1 " +
                    "order by r.floor, r.room_id";

    private List<Rooms> roomsList = new ArrayList<>();

    // Lấy toàn bộ phòng
    @Override
    public List<RoomDTO> getAllRooms() {
        List<RoomDTO> roomsList = new ArrayList<>();

        try (
                Connection connection = ConnectDB.getConnectDB();
                PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ROOMS);
                ResultSet resultSet = preparedStatement.executeQuery();
        ) {
            while (resultSet.next()) {
                String roomId = resultSet.getString("room_id");
                int floor = resultSet.getInt("floor");
                float area = resultSet.getFloat("area");
                double price = resultSet.getDouble("price");
                String status = resultSet.getString("status");
                Date updatedAt = resultSet.getDate("updated_at");
                String tenantName = resultSet.getString("tenant_name");
                roomsList.add(new RoomDTO(roomId, floor, area, price, status, tenantName, updatedAt));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi lấy danh sách phòng", e);
        }
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
