package com.example.case_study.repository;

import com.example.case_study.entity.Bookings;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookingsRepository implements IBookingsRepository {

    private List<Bookings> bookingsList;

    public BookingsRepository() {
        bookingsList = new ArrayList<>();
    }

    // Lấy toàn bộ booking
    @Override
    public List<Bookings> getAllBookings() {
        return bookingsList;
    }

    // Thêm booking (không trùng ID)
    @Override
    public boolean addBooking(Bookings booking) {
        if (booking == null) return false;

        if (findById(booking.getBookingId()) != null) {
            return false;
        }

        bookingsList.add(booking);
        return true;
    }

    // Cập nhật booking
    @Override
    public boolean updateBooking(Bookings booking) {
        if (booking == null) return false;

        for (int i = 0; i < bookingsList.size(); i++) {
            if (bookingsList.get(i).getBookingId() == booking.getBookingId()) {
                bookingsList.set(i, booking);
                return true;
            }
        }
        return false;
    }

    // Xóa booking
    @Override
    public boolean deleteBooking(int bookingId) {
        return bookingsList.removeIf(b -> b.getBookingId() == bookingId);
    }

    // Tìm theo ID
    @Override
    public Bookings findById(int bookingId) {
        for (Bookings b : bookingsList) {
            if (b.getBookingId() == bookingId) {
                return b;
            }
        }
        return null;
    }

    // Tìm theo phòng
    @Override
    public List<Bookings> findByRoomId(String roomId) {
        List<Bookings> result = new ArrayList<>();
        for (Bookings b : bookingsList) {
            if (b.getRoomId().equals(roomId)) {
                result.add(b);
            }
        }
        return result;
    }

    // Tìm theo khách
    @Override
    public List<Bookings> findByCustomerId(String customerId) {
        List<Bookings> result = new ArrayList<>();
        for (Bookings b : bookingsList) {
            if (b.getCustomerId().equals(customerId)) {
                result.add(b);
            }
        }
        return result;
    }

    // Lọc theo trạng thái (Pending, Approved, Rejected, Expired)
    @Override
    public List<Bookings> findByStatus(String status) {
        List<Bookings> result = new ArrayList<>();
        for (Bookings b : bookingsList) {
            if (b.getStatus().equalsIgnoreCase(status)) {
                result.add(b);
            }
        }
        return result;
    }

    // Cập nhật trạng thái booking
    @Override
    public boolean updateStatus(int bookingId, String status) {
        Bookings booking = findById(bookingId);
        if (booking == null) return false;

        booking.setStatus(status);
        return true;
    }
}
