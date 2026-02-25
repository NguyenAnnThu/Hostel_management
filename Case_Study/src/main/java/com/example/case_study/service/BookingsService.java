package com.example.case_study.service;

import com.example.case_study.dto.BookingDTO;
import com.example.case_study.entity.Bookings;
import com.example.case_study.repository.BookingsRepository;
import com.example.case_study.repository.IBookingsRepository;

import java.util.List;

public class BookingsService implements IBookingsService {
    private final IBookingsRepository bookingsRepo = new BookingsRepository();

    @Override
    public List<BookingDTO> getAllBookings() {
        return bookingsRepo.getAllBookings();
    }

    @Override
    public List<BookingDTO> filter(String status, String keyword) {
        return bookingsRepo.filter(status, keyword);
    }

    @Override
    public BookingDTO findById(int bookingId) {
        return bookingsRepo.findById(bookingId);
    }

    @Override
    public boolean confirmBooking(int bookingId) {
        return bookingsRepo.updateStatus(bookingId, "confirmed");
    }

    @Override
    public boolean cancelBooking(int bookingId) {
        return bookingsRepo.updateStatus(bookingId, "cancelled");
    }

    @Override
    public List<String> getAllStatus() {
        return bookingsRepo.getAllStatus();
    }

    @Override
    public boolean addBooking(Bookings booking) {
        return bookingsRepo.save(booking);
    }
}