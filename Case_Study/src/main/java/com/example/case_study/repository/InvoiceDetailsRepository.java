package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.entity.InvoiceDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InvoiceDetailsRepository implements IInvoiceDetailsRepository {

    private static final String INSERT_SQL =
            "INSERT INTO invoice_details(invoice_id, service_code, quantity, unit_price) " +
                    "VALUES (?, ?, ?, ?)";

    @Override
    public void saveAll(int invoiceId, List<InvoiceDetails> details) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL)) {

            for (InvoiceDetails d : details) {
                ps.setInt(1, invoiceId);
                ps.setString(2, d.getServiceCode());
                ps.setInt(3, d.getQuantity());
                ps.setDouble(4, d.getUnitPrice());
                ps.addBatch();
            }
            ps.executeBatch();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    private static final String SELECT_BY_INVOICE =
            "SELECT * FROM invoice_details WHERE invoice_id = ?";

    @Override
    public List<InvoiceDetails> findByInvoiceId(int invoiceId) {

        List<InvoiceDetails> list = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_INVOICE)) {

            ps.setInt(1, invoiceId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                InvoiceDetails d = new InvoiceDetails();
                d.setInvoiceDetailId(rs.getInt("invoice_detail_id"));
                d.setInvoiceId(rs.getInt("invoice_id"));
                d.setServiceCode(rs.getString("service_code"));
                d.setQuantity(rs.getInt("quantity"));
                d.setUnitPrice(rs.getDouble("unit_price"));
                list.add(d);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
