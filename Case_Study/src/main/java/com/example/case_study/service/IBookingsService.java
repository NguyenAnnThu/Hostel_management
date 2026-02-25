package com.example.case_study.service;

import com.example.case_study.dto.BookingDTO;
import com.example.case_study.entity.Bookings;

import java.util.List;

public interface IBookingsService {
    List<BookingDTO> getAllBookings();
    List<BookingDTO> filter(String status, String keyword);
    BookingDTO findById(int bookingId);
    boolean confirmBooking(int bookingId);
    boolean cancelBooking(int bookingId);
    List<String> getAllStatus();
    boolean addBooking(Bookings booking);
}