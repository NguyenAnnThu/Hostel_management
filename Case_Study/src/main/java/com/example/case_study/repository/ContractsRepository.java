package com.example.case_study.repository;

import util.ConnectDB;
import com.example.case_study.entity.Contracts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ContractsRepository implements IContractsRepository {

    private static final String UPDATE_CONTRACT = "UPDATE contracts SET room_id=?, customer_id=?, start_date=?, end_date=?, deposit=?, status=? WHERE contract_id=?";
    private static final String GET_ALL_CONTRACTS = "select * from contracts";

    private List<Contracts> contractsList;

    public ContractsRepository() {
        contractsList = new ArrayList<>();
    }

    // Lấy tất cả hợp đồng
    @Override
    public List<Contracts> getAllContracts() {
        List<Contracts> list = new ArrayList<>();
        Connection connec = ConnectDB.getConnectDB();
        System.out.println("Connection trong repository: " + connec);
        try(
                PreparedStatement preparedStatement = connec.prepareStatement(GET_ALL_CONTRACTS);
                ResultSet rs = preparedStatement.executeQuery();
                ) {
            while(rs.next()) {
                int contractId = rs.getInt("contract_id");
                String roomId = rs.getString("room_id");
                String customerId = rs.getString("customer_id");
                LocalDate startDate = rs.getDate("start_date") != null
                        ? rs.getDate("start_date").toLocalDate()
                        : null;
                LocalDate endDate = rs.getDate("end_date") != null
                        ? rs.getDate("end_date").toLocalDate()
                        : null;
                double deposit = rs.getDouble("deposit");
                String status = rs.getString("status");
                Date createdAt = rs.getDate("created_at");

                list.add(new Contracts(contractId, roomId, customerId, startDate, endDate, deposit, status, createdAt));
            }
        }catch (SQLException e) {
            throw new RuntimeException("Lỗi lấy danh sách Hợp đồng", e);
        }
        return list;
    }

    // Thêm hợp đồng
    @Override
    public boolean addContract(Contracts contract) {
        if (contract == null) return false;

        if (findById(contract.getContractId()) != null) {
            return false; // trùng ID
        }

        contractsList.add(contract);
        return true;
    }

    // Cập nhật hợp đồng
    @Override
    public boolean updateContract(Contracts contract) {
//        try (Connection conn = ConnectDB.getConnectDB();
//             PreparedStatement ps = conn.prepareStatement(UPDATE_CONTRACT)) {
//
//            ps.setString(1, contract.getRoomId());
//            ps.setString(2, contract.getCustomerId());
//            ps.setDate(3, java.sql.Date.valueOf(contract.getStartDate()));
//            ps.setDate(4, java.sql.Date.valueOf(contract.getEndDate()));
//            ps.setDouble(5, contract.getDeposit());
//            ps.setString(6, contract.getStatus());
//            ps.setInt(7, contract.getContractId());
//
//            return ps.executeUpdate() > 0;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return false;
    }

    // Xóa hợp đồng
    @Override
    public boolean deleteContract(int contractId) {
        return contractsList.removeIf(c -> c.getContractId() == contractId);
    }

    // Tìm theo ID
    @Override
    public Contracts findById(int contractId) {
        for (Contracts c : contractsList) {
            if (c.getContractId() == contractId) {
                return c;
            }
        }
        return null;
    }

    // Tìm theo phòng
    @Override
    public List<Contracts> findByRoomId(String roomId) {
        List<Contracts> result = new ArrayList<>();
        for (Contracts c : contractsList) {
            if (c.getRoomId().equals(roomId)) {
                result.add(c);
            }
        }
        return result;
    }

    // Tìm theo khách thuê
    @Override
    public List<Contracts> findByCustomerId(String customerId) {
        List<Contracts> result = new ArrayList<>();
        for (Contracts c : contractsList) {
            if (c.getCustomerId().equals(customerId)) {
                result.add(c);
            }
        }
        return result;
    }

    // Lọc theo trạng thái
    @Override
    public List<Contracts> findByStatus(String status) {
        List<Contracts> result = new ArrayList<>();
        for (Contracts c : contractsList) {
            if (c.getStatus().equalsIgnoreCase(status)) {
                result.add(c);
            }
        }
        return result;
    }

    // Cập nhật trạng thái hợp đồng
    @Override
    public boolean updateStatus(int contractId, String status) {
        Contracts contract = findById(contractId);
        if (contract == null) return false;

        contract.setStatus(status);
        return true;
    }
}
