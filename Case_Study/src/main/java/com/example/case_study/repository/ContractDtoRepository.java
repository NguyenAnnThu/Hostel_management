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
                ){
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
        }catch (SQLException e) {
            throw new RuntimeException("Lỗi lấy danh sách Hợp đồng", e);
        }
        return list;
    }

    // Cập nhật hợp đồng
    @Override
    public boolean updateContract(int id, String roomId, String customerId, LocalDate startDate, LocalDate endDate, double deposit, String status) {
        try (Connection conn = ConnectDB.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(UPDATE_CONTRACT)) {

            ps.setString(1, roomId);
            ps.setString(2, customerId);
            ps.setDate(3, startDate != null ? java.sql.Date.valueOf(startDate) : null);
            ps.setDate(4, endDate != null ? java.sql.Date.valueOf(endDate) : null);
            ps.setDouble(5, deposit);
            ps.setString(6, status);
            ps.setInt(7, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addContract(String roomId, String customerId,
                               LocalDate startDate, LocalDate endDate,
                               double deposit, String status) {

        try (Connection conn = ConnectDB.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(INSERT_CONTRACT)) {

            ps.setString(1, roomId);
            ps.setString(2, customerId);
            ps.setDate(3, java.sql.Date.valueOf(startDate));
            ps.setDate(4, java.sql.Date.valueOf(endDate));
            ps.setDouble(5, deposit);
            ps.setString(6, status);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteContract(int id) {
        try (Connection conn = ConnectDB.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(DELETE_CONTRACT)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
