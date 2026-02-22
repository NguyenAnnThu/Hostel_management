package com.example.case_study.repository;

import com.example.case_study.dto.RoomDTO;
import com.example.case_study.entity.Rooms;
import com.example.case_study.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RoomOwnerRepository implements IRoomsRepository {
    private static final String ADD_ROOM = "insert into rooms(room_id, floor, area, price, max_occupants, description, status, image) values(?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String FIND_ROOM_BY_ID = "select r.room_id, r.floor, r.area, r.price, r.max_occupants, r.description, r.status, r.image, r.created_at, r.updated_at from rooms r WHERE r.room_id = ? AND r.is_deleted = 0";
    private static final String GET_ALL_ROOMS = "select * from rooms WHERE is_deleted = 0 order by floor, room_id";
    private static final String GET_ALL_ROOMS_DTO = "SELECT r.*, u.full_name as tenant_name FROM rooms r LEFT JOIN contracts c ON r.room_id = c.room_id AND c.status = 'active' LEFT JOIN users u ON c.customer_id = u.user_id WHERE r.is_deleted = 0 ORDER BY r.floor, r.room_id";
    private static final String GET_ALL_FLOORS = "select distinct floor from rooms WHERE is_deleted = 0 order by floor";
    private static final String GET_ALL_STATUS = "select distinct status from rooms WHERE is_deleted = 0 order by status";
    private static final String UPDATE_ROOM = "update rooms set floor = ?, area = ?, price = ?, max_occupants = ?, description = ?, status = ?, image = ?, updated_at = CURRENT_TIMESTAMP where room_id = ? AND is_deleted = 0";
    private static final String DELETE_ROOM = "UPDATE rooms SET is_deleted = 1 WHERE room_id = ?";
    private static final String FIND_BY_STATUS = "SELECT * FROM rooms WHERE status = ? AND is_deleted = 0";
    private static final String FIND_BY_FLOOR  = "SELECT * FROM rooms WHERE floor = ? AND is_deleted = 0";
    private static final String FILTER_ROOMS =
            "SELECT r.*, u.full_name as tenant_name FROM rooms r " +
                    "LEFT JOIN contracts c ON r.room_id = c.room_id AND c.status = 'active' " +
                    "LEFT JOIN users u ON c.customer_id = u.user_id " +
                    "WHERE r.is_deleted = 0 " +
                    "AND (? = 0 OR r.floor = ?) " +
                    "AND (? = '' OR r.status = ?) " +
                    "AND r.price >= ? " +
                    "AND r.price <= ? " +
                    "AND (? = '' OR r.room_id LIKE ?) " +
                    "ORDER BY r.floor, r.room_id";

    // Lấy toàn bộ phòng
    @Override
    public List<Rooms> getAllRooms() {
        List<Rooms> roomsList = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ROOMS);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String roomId = resultSet.getString("room_id");
                int floor = resultSet.getInt("floor");
                double area = resultSet.getDouble("area");
                double price = resultSet.getDouble("price");
                int maxOccupants = resultSet.getInt("max_occupants");
                String description = resultSet.getString("description");
                String status = resultSet.getString("status");
                String image = resultSet.getString("image");
                Date createdAt = resultSet.getDate("created_at");
                Date updatedAt = resultSet.getDate("updated_at");
                roomsList.add(new Rooms(roomId, floor, area, price, maxOccupants, description, status, image, createdAt, updatedAt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomsList;
    }

    @Override
    public List<RoomDTO> getAllRoomsDTO() {
        List<RoomDTO> roomsList = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ROOMS_DTO);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String roomId = resultSet.getString("room_id");
                int floor = resultSet.getInt("floor");
                double area = resultSet.getDouble("area");
                double price = resultSet.getDouble("price");
                int maxOccupants = resultSet.getInt("max_occupants");
                String description = resultSet.getString("description");
                String status = resultSet.getString("status");
                String image = resultSet.getString("image");
                Date createDate = resultSet.getDate("created_at");
                Date updateDate = resultSet.getDate("updated_at");
                String tenantName = resultSet.getString("tenant_name");
                RoomDTO roomDTO = new RoomDTO(roomId, floor, area, price, maxOccupants, description, status, image, createDate, updateDate, tenantName);
                roomsList.add(roomDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomsList;
    }

    @Override
    public List<Integer> getAllFloors() {
        List<Integer> floorList = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_FLOORS);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                floorList.add(resultSet.getInt("floor"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return floorList;
    }

    @Override
    public List<String> getAllStatus() {
        List<String> statusList = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_STATUS);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                statusList.add(resultSet.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return statusList;
    }

    // Thêm phòng mới
    @Override
    public boolean addRoom(Rooms room) {
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_ROOM);) {
            preparedStatement.setString(1, room.getRoomId());
            preparedStatement.setInt(2, room.getFloor());
            preparedStatement.setDouble(3, room.getArea());
            preparedStatement.setDouble(4, room.getPrice());
            preparedStatement.setInt(5, room.getMaxOccupants());
            preparedStatement.setString(6, room.getDescription());
            preparedStatement.setString(7, room.getStatus());
            preparedStatement.setString(8, room.getImage());
            int rowEffected = preparedStatement.executeUpdate();
            return rowEffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật phòng
    @Override
    public boolean updateRoom(Rooms room) {
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ROOM);) {
            preparedStatement.setInt(1, room.getFloor());
            preparedStatement.setDouble(2, room.getArea());
            preparedStatement.setDouble(3, room.getPrice());
            preparedStatement.setInt(4, room.getMaxOccupants());
            preparedStatement.setString(5, room.getDescription());
            preparedStatement.setString(6, room.getStatus());
            preparedStatement.setString(7, room.getImage());
            preparedStatement.setString(8, room.getRoomId());
            int rowEffected = preparedStatement.executeUpdate();
            return rowEffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa phòng
    @Override
    public boolean deleteRoom(String roomId) {
        try (Connection connection = ConnectDB.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ROOM);) {
            preparedStatement.setString(1, roomId);
            int rowEffected = preparedStatement.executeUpdate();
            return rowEffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Tìm theo mã phòng
    @Override
    public Rooms findById(String roomId) {
        try (Connection connection = ConnectDB.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_ROOM_BY_ID);) {
            preparedStatement.setString(1, roomId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String roomID = resultSet.getNString("room_id");
                int floor = resultSet.getInt("floor");
                double area = resultSet.getDouble("area");
                double price = resultSet.getDouble("price");
                int maxOccupants = resultSet.getInt("max_occupants");
                String description = resultSet.getNString("description");
                String status = resultSet.getString("status");
                String image = resultSet.getNString("image");
                Date createdAt = resultSet.getDate("created_at");
                Date updatedAt = resultSet.getDate("updated_at");
                Rooms findedRoom = new Rooms(roomID, floor, area, price, maxOccupants, description, status, image, createdAt, updatedAt);
                return findedRoom;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Lọc theo trạng thái (AVAILABLE, OCCUPIED, MAINTENANCE...)
    @Override
    public List<Rooms> findByStatus(String status) {
        List<Rooms> result = new ArrayList<>();
        try (Connection conn = ConnectDB.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(FIND_BY_STATUS)) {
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new Rooms(
                        rs.getString("room_id"), rs.getInt("floor"),
                        rs.getDouble("area"), rs.getDouble("price"),
                        rs.getInt("max_occupants"), rs.getString("description"),
                        rs.getString("status"), rs.getString("image"),
                        rs.getDate("created_at"), rs.getDate("updated_at")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return result;
    }

    // Lọc theo tầng
    @Override
    public List<Rooms> findByFloor(int floor) {
        List<Rooms> result = new ArrayList<>();
        try (Connection conn = ConnectDB.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(FIND_BY_FLOOR)) {
            ps.setInt(1, floor);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new Rooms(
                        rs.getString("room_id"), rs.getInt("floor"),
                        rs.getDouble("area"), rs.getDouble("price"),
                        rs.getInt("max_occupants"), rs.getString("description"),
                        rs.getString("status"), rs.getString("image"),
                        rs.getDate("created_at"), rs.getDate("updated_at")
                ));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return result;
    }

    @Override
    public List<RoomDTO> filterRooms(int floor, String status, double minPrice, double maxPrice, String roomId) {
        List<RoomDTO> roomDTOList = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(FILTER_ROOMS);) {
            preparedStatement.setInt(1, floor);
            preparedStatement.setInt(2, floor);

            preparedStatement.setString(3, status);
            preparedStatement.setString(4, status);

            preparedStatement.setDouble(5, minPrice);
            preparedStatement.setDouble(6, maxPrice);

            preparedStatement.setString(7, roomId);
            preparedStatement.setString(8, "%"+ roomId + "%");

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String newRoomId = resultSet.getString("room_id");
                int newFloor = resultSet.getInt("floor");
                double newArea = resultSet.getDouble("area");
                double newPrice = resultSet.getDouble("price");
                int newMaxOccupants = resultSet.getInt("max_occupants");
                String newDescription = resultSet.getString("description");
                String newStatus = resultSet.getString("status");
                String newImage = resultSet.getString("image");
                Date newCreateDate = resultSet.getDate("created_at");
                Date newUpdateDate = resultSet.getDate("updated_at");
                String newTenantName = resultSet.getString("tenant_name");
                RoomDTO roomDTO = new RoomDTO(newRoomId, newFloor, newArea, newPrice, newMaxOccupants, newDescription, newStatus, newImage, newCreateDate, newUpdateDate, newTenantName);
                roomDTOList.add(roomDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomDTOList;
    }
}
