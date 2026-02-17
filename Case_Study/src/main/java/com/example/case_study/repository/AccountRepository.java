package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.entity.Account;
import com.example.case_study.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountRepository implements IAccountRepository {
    private static final String FIND_BY_PHONE_SQL = """
    SELECT  a.phone,
        a.role,
        a.password,
        u.user_id,
        u.full_name,
        u.email,
        u.address,
        u.status,
        u.date_of_birth
    FROM accounts a
    JOIN users u ON a.phone = u.phone
    WHERE a.phone = ?
    
""";
    private static final  String LOGIN_SQL = """
        SELECT a.phone, a.role,
               u.user_id, u.full_name, u.status
        FROM accounts a
        JOIN users u ON a.phone = u.phone
        WHERE a.phone = ? AND a.password = ?
    """;
    private static final String CHECK_PHONE_SQL =
            "SELECT 1 FROM users WHERE phone = ?";

    private static final String INSERT_USER_SQL = """
        INSERT INTO users
        (user_id, full_name, phone, email, status, citizen_id, address, date_of_birth)
        VALUES (?, ?, ?, ?, 'active', ?, ?, ?)
    """;

    private static final String INSERT_ACCOUNT_SQL = """
        INSERT INTO accounts (phone, password, role)
        VALUES (?, ?, ?)
    """;
    @Override
    public Account login(String phone, String password) {

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(LOGIN_SQL)) {

            ps.setString(1, phone);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (!rs.next()) return null;

            User user = new User();
            user.setUserId(rs.getString("user_id"));
            user.setFullName(rs.getString("full_name"));
            user.setStatus(rs.getString("status"));

            Account acc = new Account();
            acc.setPhone(phone);
            acc.setRole(rs.getString("role"));
            acc.setUser(user);

            return acc;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Account findByPhone(String phone) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(FIND_BY_PHONE_SQL)) {

            ps.setString(1, phone);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapAccount(rs, true);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }
    private Account mapAccount(ResultSet rs, boolean includePassword) throws Exception {

        User user = new User();
        user.setUserId(rs.getString("user_id"));
        user.setFullName(rs.getString("full_name"));
        user.setEmail(rs.getString("email"));
        user.setAddress(rs.getString("address"));
        user.setStatus(rs.getString("status"));

        Account account = new Account();
        account.setPhone(rs.getString("phone"));
        account.setRole(rs.getString("role"));

        if (includePassword) {
            account.setPassword(rs.getString("password"));
        }

        account.setUser(user);
        return account;
    }

    @Override
    public boolean existsByPhone(String phone) {
        String sql = "SELECT phone FROM users WHERE phone = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void register(User user, Account account) {

        String insertUser = """
            INSERT INTO users
            (user_id, full_name, phone, email, status, citizen_id, address, date_of_birth)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """;

        String insertAccount = """
            INSERT INTO accounts (phone, password, role)
            VALUES (?, ?, ?)
        """;

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement psUser = conn.prepareStatement(insertUser);
                 PreparedStatement psAcc = conn.prepareStatement(insertAccount)) {

                // USERS
                psUser.setString(1, user.getUserId());
                psUser.setString(2, user.getFullName());
                psUser.setString(3, user.getPhone());
                psUser.setString(4, user.getEmail());
                psUser.setString(5, "active");
                psUser.setString(6, user.getCitizenId());
                psUser.setString(7, user.getAddress());
                psUser.setDate(8, new java.sql.Date(user.getDateOfBirth().getTime()));
                psUser.executeUpdate();

                // ACCOUNTS (ROLE FIX CỨNG)
                psAcc.setString(1, user.getPhone());
                psAcc.setString(2, account.getPassword());
                psAcc.setString(3, "USER"); // ❗ BẮT BUỘC
                psAcc.executeUpdate();

                conn.commit();
            } catch (Exception e) {
                conn.rollback();
                throw e;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getMaxUserId() {
        String sql = "SELECT MAX(user_id) FROM users";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getString(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void updatePassword(String phone, String password) {

        String sql = "UPDATE accounts SET password = ? WHERE phone = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, password);
            ps.setString(2, phone);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
