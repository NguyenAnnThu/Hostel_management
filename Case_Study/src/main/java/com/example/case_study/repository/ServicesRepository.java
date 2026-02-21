package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.entity.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServicesRepository implements IServicesRepository {


    @Override
    public List<Map<String, Object>> findAllServices() {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = """
            SELECT service_code, service_name, service_type, unit, default_price, status
            FROM services
        """;

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("code", rs.getString("service_code"));
                row.put("name", rs.getString("service_name"));
                row.put("type", rs.getString("service_type"));
                row.put("unit", rs.getString("unit"));
                row.put("price", rs.getDouble("default_price"));
                row.put("status", rs.getString("status"));
                list.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void insertService(String code, String name, String type, String unit, double price, String status) {
        String sql = """
            INSERT INTO services(service_code, service_name, service_type, unit, default_price, status)
            VALUES (?, ?, ?, ?, ?, ?)
        """;

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, code);
            ps.setString(2, name);
            ps.setString(3, type);
            ps.setString(4, unit);
            ps.setDouble(5, price);
            ps.setString(6, status);
            ps.executeUpdate();

            insertServicePriceConfig(code, price);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateService(String code, String name, String type, String unit, double price, String status) {
        String sql = """
            UPDATE services
            SET service_name=?, service_type=?, unit=?, default_price=?, status=?
            WHERE service_code=?
        """;

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, type);
            ps.setString(3, unit);
            ps.setDouble(4, price);
            ps.setString(5, status);
            ps.setString(6, code);
            ps.executeUpdate();

            insertServicePriceConfig(code, price);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertServicePriceConfig(String serviceCode, double price) {
        String sql = """
            INSERT INTO service_price_config(service_code, price, effective_date)
            VALUES (?, ?, CURDATE())
        """;

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, serviceCode);
            ps.setDouble(2, price);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
