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
    private static final String GET_ALL_ROOMS = "select r.room_id, r.floor, r.area, r.price, r.status, r.image, r.updated_at, u.full_name AS tenant_name "
            +
            "from rooms r " +
            "left join room_tenants rt " +
            "on r.room_id = rt.room_id " +
            "and rt.status = 'staying' " +
            "left join users u " +
            "on rt.user_id = u.user_id " +
            "where 1 = 1 " +
            "order by r.floor, r.room_id";
    private static final String UPDATE_ROOM_STATUS = "UPDATE rooms SET status=? WHERE room_id=?";
    private static final String GET_ALL_ROOMS_USER = "select * from rooms";
    private List<Rooms> roomsList = new ArrayList<>();

    // Lấy toàn bộ phòng
    @Override
    public List<RoomDTO> getAllRooms() {
        List<RoomDTO> roomsList = new ArrayList<>();

        try (
                Connection connection = ConnectDB.getConnectDB();
                PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ROOMS);
                ResultSet resultSet = preparedStatement.executeQuery();) {
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


    public boolean updateRoomStatus(Connection conn, String roomId, String status) throws SQLException {
        String sql = "UPDATE rooms SET status=?, updated_at=NOW() WHERE room_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, roomId);
            return ps.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updateRoomStatus(String roomId, String status) {
        try (Connection conn = ConnectDB.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(UPDATE_ROOM_STATUS)) {

            ps.setString(1, status);
            ps.setString(2, roomId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // lấy toàn bộ phòng hiển thị cho user
    @Override
    public List<Rooms> getRoomsList() {
        List<Rooms> roomsList = new ArrayList<>();
        try (
                Connection connection = ConnectDB.getConnectDB();
                PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ROOMS_USER);
                ResultSet resultSet = preparedStatement.executeQuery();
        ) {
            while (resultSet.next()) {
                String roomId = resultSet.getString("room_id");
                int floor = resultSet.getInt("floor");
                double area = resultSet.getDouble("area");
                double price = resultSet.getDouble("price");
                int maxOccupants = resultSet.getInt("max_occupants");
                String description = resultSet.getString("description");
                String status = resultSet.getString("status");
                Date createdAt = resultSet.getDate("created_at");
                Date updatedAt = resultSet.getDate("updated_at");
                String image = resultSet.getString("image");

                roomsList.add(new Rooms(roomId, floor, area, price, maxOccupants, description, status, image, createdAt,
                        updatedAt));
//                roomsList.add(new Rooms(roomId, floor, area, price, maxOccupants, description, status, createdAt,
//                        updatedAt));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return roomsList;
    }

    // Thêm phòng mới
    @Override
    public boolean addRoom(Rooms room) {
        if (room == null)
            return false;

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
        if (existing == null)
            return false;

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
        String sql = "select * from rooms where room_id = ?";
        try (
                Connection conn = ConnectDB.getConnectDB();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setString(1, roomId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Rooms(
                        rs.getString("room_id"),
                        rs.getInt("floor"),
                        rs.getDouble("area"),
                        rs.getDouble("price"),
                        rs.getInt("max_occupants"),
                        rs.getString("description"),
                        rs.getString("status"),
                        rs.getString("image"),
                        rs.getDate("created_at"),
                        rs.getDate("updated_at")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
//        for (Rooms r : roomsList) {
//            if (r.getRoomId().equalsIgnoreCase(roomId)) {
//                return r;
//            }
//        }
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

    // Tìm kiếm theo tên phòng (gần đúng) và tầng (tùy chọn)
    public List<Rooms> searchRooms(String roomName, Integer floor) {
        List<Rooms> list = getRoomsList();
        List<Rooms> result = new ArrayList<>();

        for (Rooms r : list) {
            boolean matchName = true;
            boolean matchFloor = true;

            // Kiểm tra tên phòng (gần đúng, không phân biệt hoa thường)
            if (roomName != null && !roomName.trim().isEmpty()) {
                matchName = r.getRoomId().toLowerCase().contains(roomName.toLowerCase());
            }

            // Kiểm tra tầng
            if (floor != null && floor > 0) {
                matchFloor = r.getFloor() == floor;
            }

            // Nếu cả hai điều kiện đều thỏa mãn, thêm vào kết quả
            if (matchName && matchFloor) {
                result.add(r);
            }
        }

        return result;
    }
}
