package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;


public class ServicePriceConfigRepository implements IServicePriceConfigRepository {

    @Override
    public Double findCurrentPrice(String code) {

        String sql = """
            SELECT price
            FROM service_price_config
            WHERE service_code = ?
            ORDER BY effective_date DESC
            LIMIT 1
        """;

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble("price");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void insertPrice(String code, double price, LocalDate date) {

        String sql = """
            INSERT INTO service_price_config
            (service_code, price, effective_date)
            VALUES (?, ?, ?)
        """;

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, code);
            ps.setDouble(2, price);
            ps.setDate(3, Date.valueOf(date));
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
