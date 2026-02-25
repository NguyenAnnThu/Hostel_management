package com.example.case_study.repository;

import com.example.case_study.common.DBConnection;
import com.example.case_study.dto.BookingDTO;
import com.example.case_study.entity.Bookings;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingsRepository implements IBookingsRepository {

    private static final String SELECT_ALL =
            "SELECT b.*, u.full_name, u.phone FROM bookings b " +
                    "JOIN users u ON b.customer_id = u.user_id " +
                    "ORDER BY b.booking_date DESC";

    private static final String FILTER_SQL =
            "SELECT b.*, u.full_name, u.phone FROM bookings b " +
                    "JOIN users u ON b.customer_id = u.user_id " +
                    "WHERE 1=1";

    private static final String UPDATE_STATUS_SQL =
            "UPDATE bookings SET status = ? WHERE booking_id = ?";

    private static final String FIND_BY_ID_SQL =
            "SELECT b.*, u.full_name, u.phone FROM bookings b " +
                    "JOIN users u ON b.customer_id = u.user_id " +
                    "WHERE b.booking_id = ?";

    private static final String INSERT_SQL =
            "INSERT INTO bookings(room_id, customer_id, booking_date, expire_date, status) " +
                    "VALUES (?, ?, ?, ?, ?)";

    private BookingDTO mapRow(ResultSet rs) throws SQLException {
        BookingDTO  b = new BookingDTO ();
        b.setBookingId(rs.getInt("booking_id"));
        b.setRoomId(rs.getString("room_id"));
        b.setCustomerId(rs.getString("customer_id"));
        b.setCustomerName(rs.getString("full_name"));
        b.setCustomerPhone(rs.getString("phone"));
        b.setBookingDate(rs.getTimestamp("booking_date"));
        b.setExpireDate(rs.getTimestamp("expire_date"));
        b.setStatus(rs.getString("status"));
        return b;
    }

    @Override
    public List<BookingDTO> getAllBookings() {
        List<BookingDTO> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(mapRow(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookingDTO> filter(String status, String keyword) {
        List<Object> params = new ArrayList<>();
        StringBuilder sql = new StringBuilder(FILTER_SQL);

        if (status != null && !status.isEmpty()) {
            sql.append(" AND b.status = ?");
            params.add(status);
        }
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (b.room_id LIKE ? OR u.full_name LIKE ?)");
            params.add("%" + keyword + "%");
            params.add("%" + keyword + "%");
        }
        sql.append(" ORDER BY b.booking_date DESC");

        List<BookingDTO> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public BookingDTO findById(int bookingId) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(FIND_BY_ID_SQL)) {
            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateStatus(int bookingId, String status) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_STATUS_SQL)) {
            ps.setString(1, status);
            ps.setInt(2, bookingId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<String> getAllStatus() {
        List<String> result = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT DISTINCT status FROM bookings ORDER BY status");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) result.add(rs.getString("status"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean save(Bookings booking) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL)) {

            ps.setString(1, booking.getRoomId());
            ps.setString(2, booking.getCustomerId());
            ps.setTimestamp(3, new Timestamp(booking.getBookingDate().getTime()));
            ps.setTimestamp(4, new Timestamp(booking.getExpireDate().getTime()));
            ps.setString(5, booking.getStatus());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}