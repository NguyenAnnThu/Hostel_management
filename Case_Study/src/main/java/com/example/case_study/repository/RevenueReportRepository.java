package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.entity.RevenueByQuater;
import com.example.case_study.entity.RevenueByRoom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class RevenueReportRepository implements IRevenueReportRepository{

    @Override
    public int countTotalRooms() {
        return countBySQL("SELECT COUNT(*) FROM rooms");
    }

    @Override
    public int countAvailableRooms() {
        return countBySQL("SELECT COUNT(*) FROM rooms WHERE status='available'");
    }

    @Override
    public int countRentedRooms() {
        return countBySQL("SELECT COUNT(*) FROM rooms WHERE status='rented'");
    }

    @Override
    public int countPendingBookings() {
        return countBySQL("SELECT COUNT(*) FROM bookings WHERE status='pending'");
    }

    @Override
    public int countUnpaidInvoices() {
        return countBySQL("SELECT COUNT(*) FROM invoices WHERE status='unpaid'");
    }

    @Override
    public double getMonthlyRevenue(int month, int year) {
        String sql = """
            SELECT SUM(d.quantity * d.unit_price) AS revenue
            FROM invoices i
            JOIN invoice_details d ON i.invoice_id = d.invoice_id
            WHERE i.status = 'paid'
              AND i.month = ?
              AND i.year = ?
        """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, month);
            ps.setInt(2, year);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getDouble("revenue");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Map<String, Double> getLast6MonthsRevenue() {
        Map<String, Double> data = new LinkedHashMap<>();

        String sql = """
            SELECT CONCAT(month,'/',year) AS period,
                   SUM(d.quantity * d.unit_price) AS revenue
            FROM invoices i
            JOIN invoice_details d ON i.invoice_id = d.invoice_id
            WHERE i.status = 'paid'
            GROUP BY year, month
            ORDER BY year DESC, month DESC
            LIMIT 6
        """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                data.put(rs.getString("period"), rs.getDouble("revenue"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
    private int countBySQL(String sql) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    @Override
    public Map<String, Double> getLast3MonthsRevenue() {
        Map<String, Double> data = new LinkedHashMap<>();

        String sql = """
        SELECT CONCAT(i.month,'/',i.year) AS period,
               SUM(d.quantity * d.unit_price) AS revenue
        FROM invoices i
        JOIN invoice_details d ON i.invoice_id = d.invoice_id
        WHERE i.status = 'paid'
        GROUP BY i.year, i.month
        ORDER BY i.year DESC, i.month DESC
        LIMIT 3
    """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                data.put(rs.getString("period"), rs.getDouble("revenue"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

}
