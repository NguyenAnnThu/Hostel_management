package com.example.case_study.repository;

import dto.ContractDTO;
import util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class ContractDtoRepository implements IContractDtoRepository {

    private static final String DELETE_CONTRACT = "DELETE FROM contracts WHERE contract_id=?";
    private static final String UPDATE_CONTRACT = "UPDATE contracts SET room_id=?, customer_id=?, start_date=?, end_date=?, deposit=?, status=? WHERE contract_id=?";
    private static final String GET_ALL_CONTRACTS = "SELECT c.*, u.full_name\n" + "FROM contracts c\n" + "JOIN users u ON c.customer_id = u.user_id; ";
    private static final String INSERT_CONTRACT = "INSERT INTO contracts(room_id, customer_id, start_date, end_date, deposit, status, created_at) " + "VALUES(?,?,?,?,?,?,NOW())";
    private List<ContractDTO> list;
    private RoomsRepository roomsRepository = new RoomsRepository();

    public ContractDtoRepository() {
        list = new ArrayList<>();
    }

    @Override
    public List<ContractDTO> getAllContracts() {

        List<ContractDTO> list = new ArrayList<>();
        Connection connec = ConnectDB.getConnectDB();
        try (
                PreparedStatement preparedStatement = connec.prepareStatement(GET_ALL_CONTRACTS);
                ResultSet rs = preparedStatement.executeQuery();
        ) {
            while (rs.next()) {
                int contractId = rs.getInt("contract_id");
                String roomId = rs.getString("room_id");
                String customerId = rs.getString("customer_id");
                LocalDate startDate = rs.getDate("start_date").toLocalDate();
                LocalDate endDate = rs.getDate("end_date").toLocalDate();
                double deposit = rs.getDouble("deposit");
                String status = rs.getString("status");
                Date createdAt = rs.getDate("created_at");
                String name = rs.getString("full_name");
                list.add(new ContractDTO(contractId, roomId, customerId, startDate, endDate, deposit, status, createdAt, name));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi lấy danh sách Hợp đồng", e);
        }
        return list;
    }

    // Cập nhật hợp đồng
    @Override
    public boolean updateContract(int id, String newRoomId, String customerId, LocalDate startDate, LocalDate endDate, double deposit, String status) {

        Connection conn = null;

        try {
            conn = ConnectDB.getConnectDB();
            conn.setAutoCommit(false);

            // 1. Lấy room cũ
            String oldRoomSql = "SELECT room_id FROM contracts WHERE contract_id=?";
            PreparedStatement psOld = conn.prepareStatement(oldRoomSql);
            psOld.setInt(1, id);
            ResultSet rs = psOld.executeQuery();

            String oldRoomId = null;
            if (rs.next()) {
                oldRoomId = rs.getString("room_id");
            }

            // 2. Update contract
            PreparedStatement ps = conn.prepareStatement(UPDATE_CONTRACT);
            ps.setString(1, newRoomId);
            ps.setString(2, customerId);
            ps.setDate(3, startDate != null ? java.sql.Date.valueOf(startDate) : null);
            ps.setDate(4, endDate != null ? java.sql.Date.valueOf(endDate) : null);
            ps.setDouble(5, deposit);
            ps.setString(6, status);
            ps.setInt(7, id);

            boolean updated = ps.executeUpdate() > 0;
            if (!updated) {
                conn.rollback();
                return false;
            }

            // 3. Nếu đổi phòng
            if (oldRoomId != null && !oldRoomId.equals(newRoomId)) {

                roomsRepository.updateRoomStatus(conn, oldRoomId, "available");
                roomsRepository.updateRoomStatus(conn, newRoomId, "rented");
            }

            conn.commit();
            return true;

        } catch (Exception e) {
            try {
                if (conn != null) conn.rollback();
            } catch (Exception ignored) {
            }
            e.printStackTrace();
        }

        return false;
    }

    public boolean addContract(String roomId, String customerId, LocalDate startDate, LocalDate endDate, double deposit, String status) {

        Connection conn = null;

        try {
            conn = ConnectDB.getConnectDB();
            conn.setAutoCommit(false);

            // 1. Insert contract
            PreparedStatement ps = conn.prepareStatement(INSERT_CONTRACT);
            ps.setString(1, roomId);
            ps.setString(2, customerId);
            ps.setDate(3, java.sql.Date.valueOf(startDate));
            ps.setDate(4, java.sql.Date.valueOf(endDate));
            ps.setDouble(5, deposit);
            ps.setString(6, status);

            boolean inserted = ps.executeUpdate() > 0;
            if (!inserted) {
                conn.rollback();
                return false;
            }

            // 2. Update room status -> rented
            boolean roomUpdated = roomsRepository.updateRoomStatus(conn, roomId, "rented");
            if (!roomUpdated) {
                conn.rollback();
                return false;
            }

            conn.commit();
            return true;

        } catch (Exception e) {
            try {
                if (conn != null) conn.rollback();
            } catch (Exception ignored) {
            }
            e.printStackTrace();
        }
        return false;
    }

    public List<ContractDTO> filterContracts(String status, String roomId) {

        List<ContractDTO> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT c.*, u.full_name FROM contracts c " +
                        "JOIN users u ON c.customer_id = u.user_id WHERE 1=1 "
        );

        if (status != null && !status.isEmpty()) {
            sql.append(" AND c.status = ? ");
        }

        if (roomId != null && !roomId.isEmpty()) {
            sql.append(" AND c.room_id = ? ");
        }

        try (Connection conn = ConnectDB.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int index = 1;

            if (status != null && !status.isEmpty()) {
                ps.setString(index++, status);
            }

            if (roomId != null && !roomId.isEmpty()) {
                ps.setString(index++, roomId);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new ContractDTO(
                        rs.getInt("contract_id"),
                        rs.getString("room_id"),
                        rs.getString("customer_id"),
                        rs.getDate("start_date").toLocalDate(),
                        rs.getDate("end_date").toLocalDate(),
                        rs.getDouble("deposit"),
                        rs.getString("status"),
                        rs.getDate("created_at"),
                        rs.getString("full_name")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public boolean deleteContract(int id) {

        Connection conn = null;

        try {
            conn = ConnectDB.getConnectDB();
            conn.setAutoCommit(false);

            String roomId = null;

            // 1️⃣ Lấy room_id của contract
            try (PreparedStatement ps = conn.prepareStatement(
                    "SELECT room_id FROM contracts WHERE contract_id=?")) {

                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    roomId = rs.getString("room_id");
                } else {
                    conn.rollback();
                    return false;
                }
            }

            // 2️⃣ Xoá invoices trước (QUAN TRỌNG)
            try (PreparedStatement ps = conn.prepareStatement(
                    "DELETE FROM invoices WHERE contract_id=?")) {

                ps.setInt(1, id);
                ps.executeUpdate();
            }

            // 3️⃣ Xoá contract
            try (PreparedStatement ps = conn.prepareStatement(
                    "DELETE FROM contracts WHERE contract_id=?")) {

                ps.setInt(1, id);
                int rows = ps.executeUpdate();

                if (rows == 0) {
                    conn.rollback();
                    return false;
                }
            }

            // 4️⃣ Update room → available
            try (PreparedStatement ps = conn.prepareStatement(
                    "UPDATE rooms SET status='available', updated_at=NOW() WHERE room_id=?")) {

                ps.setString(1, roomId);
                ps.executeUpdate();
            }

            conn.commit();
            return true;

        } catch (Exception e) {
            try { if (conn != null) conn.rollback(); } catch (Exception ignored) {}
            e.printStackTrace();
        }

        return false;
    }
}
