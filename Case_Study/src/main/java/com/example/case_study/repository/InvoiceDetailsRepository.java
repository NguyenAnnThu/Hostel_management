package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.entity.InvoiceDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}
