package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.entity.User;
import dto.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    private List<UserDto> userList = new ArrayList<>();

    @Override
    public List<UserDto> getAll() {

        List<UserDto> list = new ArrayList<>();

        String sql = """
                    SELECT u.*, a.role, a.password
                    FROM users u
                    LEFT JOIN accounts a ON u.phone = a.phone
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                UserDto u = new UserDto(
                        rs.getString("user_id"),
                        rs.getString("full_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("citizen_id"),
                        rs.getString("address"),
                        rs.getDate("date_of_birth"),
                        rs.getString("status")
                );

                u.setRole(rs.getString("role"));
                u.setPassword(rs.getString("password"));

                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean add(UserDto user) {

        String insertUser = """
                    INSERT INTO users
                    (user_id, full_name, phone, email, status, citizen_id, address, date_of_birth)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """;

        String insertAccount = """
                    INSERT INTO accounts (phone, password, role)
                    VALUES (?, ?, ?)
                """;

        Connection conn = null;

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);
            String newUserId = generateUserId(conn);
            user.setUserId(newUserId);
            try (PreparedStatement ps1 = conn.prepareStatement(insertUser)) {

                ps1.setString(1, user.getUserId());
                ps1.setString(2, user.getFullName());
                ps1.setString(3, user.getPhone());
                ps1.setString(4, user.getEmail());
                ps1.setString(5, user.getStatus());
                ps1.setString(6, user.getCitizenId());
                ps1.setString(7, user.getAddress());
                ps1.setDate(8, new java.sql.Date(user.getDateOfBirth().getTime()));

                ps1.executeUpdate();
            }

            try (PreparedStatement ps2 = conn.prepareStatement(insertAccount)) {

                ps2.setString(1, user.getPhone());
                ps2.setString(2, user.getPassword());
                ps2.setString(3, user.getRole());

                ps2.executeUpdate();
            }

            conn.commit();
            return true;

        } catch (Exception e) {

            if (conn != null) {
                try {
                    conn.rollback();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            e.printStackTrace();
        } finally {

            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return false;
    }

    @Override
    public boolean updateStatus(String userId, String status) {

        String sql = "UPDATE users SET status = ? WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setString(2, userId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean update(UserDto user) {

        String updateUser =
                "UPDATE users SET full_name=?, email=?, citizen_id=?, address=?, date_of_birth=?, status=? WHERE user_id=?";

        String updateAccount =
                "UPDATE accounts SET password=? WHERE phone=?";

        try (Connection conn = DBConnection.getConnection()) {

            conn.setAutoCommit(false);

            try (PreparedStatement ps1 = conn.prepareStatement(updateUser);
                 PreparedStatement ps2 = conn.prepareStatement(updateAccount)) {

                ps1.setString(1, user.getFullName());
                ps1.setString(2, user.getEmail());
                ps1.setString(3, user.getCitizenId());
                ps1.setString(4, user.getAddress());
                ps1.setDate(5, new java.sql.Date(user.getDateOfBirth().getTime()));
                ps1.setString(6, user.getStatus());
                ps1.setString(7, user.getUserId());

                ps1.executeUpdate();
                int rows = ps1.executeUpdate();
                System.out.println("Rows updated: " + rows);
                ps2.setString(1, user.getPassword());
                ps2.setString(2, user.getPhone());

                ps2.executeUpdate();

                conn.commit();
                return true;

            } catch (Exception e) {
                conn.rollback();
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    private String generateUserId(Connection conn) throws Exception {

        String sql = "SELECT user_id FROM users ORDER BY user_id DESC LIMIT 1";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                String lastId = rs.getString("user_id"); // ví dụ U00015
                int number = Integer.parseInt(lastId.substring(1));
                return String.format("U%05d", number + 1);
            }
        }

        return "U00001"; // nếu chưa có user nào
    }
    @Override
    public boolean delete(String userId) {

        String getPhone = "SELECT phone FROM users WHERE user_id = ?";
        String deleteAccount = "DELETE FROM accounts WHERE phone = ?";
        String deleteUser = "DELETE FROM users WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection()) {

            conn.setAutoCommit(false);

            String phone = null;

            try (PreparedStatement ps = conn.prepareStatement(getPhone)) {
                ps.setString(1, userId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) phone = rs.getString("phone");
            }

            if (phone != null) {
                try (PreparedStatement ps = conn.prepareStatement(deleteAccount)) {
                    ps.setString(1, phone);
                    ps.executeUpdate();
                }
            }

            try (PreparedStatement ps = conn.prepareStatement(deleteUser)) {
                ps.setString(1, userId);
                ps.executeUpdate();
            }

            conn.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public UserDto findById(String userId) {

        String sql = """
                    SELECT u.*, a.role, a.password
                    FROM users u
                    LEFT JOIN accounts a ON u.phone = a.phone
                    WHERE u.user_id = ?
                """;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                UserDto u = new UserDto(
                        rs.getString("user_id"),
                        rs.getString("full_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("citizen_id"),
                        rs.getString("address"),
                        rs.getDate("date_of_birth"),
                        rs.getString("status")
                );

                u.setRole(rs.getString("role"));
                u.setPassword(rs.getString("password"));

                return u;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<UserDto> filter(String status, String keyword) {

        List<UserDto> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("""
                    SELECT u.*, a.role, a.password
                    FROM users u
                    LEFT JOIN accounts a ON u.phone = a.phone
                    WHERE 1=1
                """);

        if (status != null && !status.isEmpty()) {
            sql.append(" AND status = ? ");
        }

        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (u.full_name LIKE ? OR u.phone LIKE ?) ");
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int index = 1;

            if (status != null && !status.isEmpty()) {
                ps.setString(index++, status);
            }

            if (keyword != null && !keyword.isEmpty()) {
                String like = "%" + keyword + "%";
                ps.setString(index++, like);
                ps.setString(index++, like);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                UserDto u = new UserDto(
                        rs.getString("user_id"),
                        rs.getString("full_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("citizen_id"),
                        rs.getString("address"),
                        rs.getDate("date_of_birth"),
                        rs.getString("status")
                );

                u.setRole(rs.getString("role"));
                u.setPassword(rs.getString("password"));

                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
