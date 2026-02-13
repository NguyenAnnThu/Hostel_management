package com.example.case_study.repository;

import com.example.case_study.entity.Bookings;

import java.util.List;

public interface IBookingsRepository {

    List<Bookings> getAllBookings();

    boolean addBooking(Bookings booking);

    boolean updateBooking(Bookings booking);

    boolean deleteBooking(int bookingId);

    Bookings findById(int bookingId);

    List<Bookings> findByRoomId(String roomId);

    List<Bookings> findByCustomerId(String customerId);

    List<Bookings> findByStatus(String status);

    boolean updateStatus(int bookingId, String status);
}
