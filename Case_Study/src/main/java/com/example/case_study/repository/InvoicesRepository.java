package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.entity.Invoices;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class InvoicesRepository implements IInvoicesRepository {

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
}
