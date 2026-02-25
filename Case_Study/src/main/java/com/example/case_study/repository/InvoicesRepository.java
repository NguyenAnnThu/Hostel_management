package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.entity.Invoices;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class InvoicesRepository implements IInvoicesRepository {
    private static final String GET_ALL_STATUS = "select distinct status from invoices order by status";
    private static final String GET_ALL_ROOM_ID = "select distinct room_id from invoices order by room_id";
    private static final String FILTER_INVOICES = "select * from invoices where 1=1";
    private static final String INSERT_SQL =
            "INSERT INTO invoices(room_id, customer_id, month, year, qr_code, status, created_at) " +
                    "VALUES (?, ?, ?, ?, ?, ?, NOW())";

    private static final String SELECT_ALL =
            "SELECT * FROM invoices ORDER BY created_at DESC";

    @Override
    public int save(Invoices invoice) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps =
                     conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, invoice.getRoomId());
            ps.setString(2, invoice.getCustomerId());
            ps.setInt(3, invoice.getMonth());
            ps.setInt(4, invoice.getYear());
            ps.setString(5, invoice.getQrCode());
            ps.setString(6, invoice.getStatus());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return -1;
    }

    @Override
    public List<Invoices> findAll() {
        List<Invoices> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Invoices(
                        rs.getInt("invoice_id"),
                        rs.getString("room_id"),
                        rs.getString("customer_id"),
                        rs.getInt("month"),
                        rs.getInt("year"),
                        rs.getString("qr_code"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at")
                ));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public List<Invoices> filter(Integer month, Integer year, String status, String roomId, String invoiceId) {
        List<Object> params = new ArrayList<>();
        StringBuilder sql = new StringBuilder(FILTER_INVOICES);
        if (month != null) {
            sql.append(" AND month = ?");
            params.add(month);
        }

        if (year != null) {
            sql.append(" AND year = ?");
            params.add(year);
        }

        if (status != null && !status.isEmpty()) {
            sql.append(" AND status = ?");
            params.add(status);
        }

        if (roomId != null && !roomId.isEmpty()) {
            sql.append(" AND room_id = ?");
            params.add(roomId);
            System.out.println("typeof roomId: " + roomId.getClass() + "");
        }

        if (invoiceId != null && !invoiceId.isEmpty()) {
            sql.append(" AND invoice_id LIKE ?");
            params.add("%" + invoiceId + "%");
        }

        sql.append(" ORDER BY created_at DESC");

        System.out.println("SQL" + sql.toString());
        System.out.println("PARAMS" + params);
        List<Invoices> list = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
        ) {
            for (int i = 0; i < params.size(); i++) {
                preparedStatement.setObject(i + 1, params.get(i));
            }

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                list.add(new Invoices(
                        resultSet.getInt("invoice_id"),
                        resultSet.getString("room_id"),
                        resultSet.getString("customer_id"),
                        resultSet.getInt("month"),
                        resultSet.getInt("year"),
                        resultSet.getString("qr_code"),
                        resultSet.getString("status"),
                        resultSet.getTimestamp("created_at")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private static final String FIND_BY_ID_SQL =
            "SELECT * FROM invoices WHERE invoice_id = ?";

    @Override
    public Invoices findById(int invoiceId) {

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(FIND_BY_ID_SQL)) {

            ps.setInt(1, invoiceId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Invoices i = new Invoices();
                i.setInvoiceId(rs.getInt("invoice_id"));
                i.setRoomId(rs.getString("room_id"));
                i.setCustomerId(rs.getString("customer_id"));
                i.setMonth(rs.getInt("month"));
                i.setYear(rs.getInt("year"));
                i.setQrCode(rs.getString("qr_code"));
                i.setStatus(rs.getString("status"));
                i.setCreatedAt(rs.getTimestamp("created_at"));
                return i;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    @Override
    public List<String> getAllStatus() {
        List<String> result = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_STATUS);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                result.add(resultSet.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List<String> getAllRoomId() {
        List<String> result = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ROOM_ID);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                result.add(resultSet.getString("room_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
