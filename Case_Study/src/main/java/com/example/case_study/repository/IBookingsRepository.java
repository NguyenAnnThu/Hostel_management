package com.example.case_study.repository;

import com.example.case_study.dto.BookingDTO;
import com.example.case_study.entity.Bookings;

import java.util.List;

public interface IBookingsRepository {
    List<BookingDTO> getAllBookings();
    List<BookingDTO> filter(String status, String keyword);
    BookingDTO findById(int bookingId);
    boolean updateStatus(int bookingId, String status);
    List<String> getAllStatus();
    boolean save(Bookings booking);
}