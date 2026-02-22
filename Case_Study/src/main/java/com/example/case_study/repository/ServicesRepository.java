package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.entity.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServicesRepository implements IServicesRepository {

    @Override
    public List<Services> findAll() {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT * FROM services";

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Services s = new Services(
                        rs.getString("service_code"),
                        rs.getString("service_name"),
                        rs.getString("service_type"),
                        rs.getString("unit"),
                        rs.getDouble("default_price"),
                        rs.getString("status")
                );
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Services findByCode(String code) {
        String sql = "SELECT * FROM services WHERE service_code = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Services(
                        rs.getString("service_code"),
                        rs.getString("service_name"),
                        rs.getString("service_type"),
                        rs.getString("unit"),
                        rs.getDouble("default_price"),
                        rs.getString("status")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void insert(Services s) {
        String sql = """
            INSERT INTO services
            (service_code, service_name, service_type, unit, default_price, status)
            VALUES (?, ?, ?, ?, ?, ?)
        """;

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, s.getServiceCode());
            ps.setString(2, s.getServiceName());
            ps.setString(3, s.getServiceType());
            ps.setString(4, s.getUnit());
            ps.setDouble(5, s.getDefaultPrice());
            ps.setString(6, s.getStatus());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Services s) {
        String sql = """
            UPDATE services
            SET service_name=?, service_type=?, unit=?, status=?
            WHERE service_code=?
        """;

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, s.getServiceName());
            ps.setString(2, s.getServiceType());
            ps.setString(3, s.getUnit());
            ps.setString(4, s.getStatus());
            ps.setString(5, s.getServiceCode());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
