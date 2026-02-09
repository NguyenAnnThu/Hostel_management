package com.example.case_study.service;

import com.example.case_study.entity.Bookings;
import com.example.case_study.repository.IBookingsRepository;
import com.example.case_study.repository.BookingsRepository;
import java.util.List;

public class BookingsService implements IBookingsService {

    private IBookingsRepository bookingsRepository;

    public BookingsService() {
        bookingsRepository = new BookingsRepository();
    }

    @Override
    public List<Bookings> getAllBookings() {
        return bookingsRepository.getAllBookings();
    }

    @Override
    public boolean addBooking(Bookings booking) {
        return bookingsRepository.addBooking(booking);
    }

    @Override
    public boolean updateBooking(Bookings booking) {
        return bookingsRepository.updateBooking(booking);
    }

    @Override
    public boolean deleteBooking(int bookingId) {
        return bookingsRepository.deleteBooking(bookingId);
    }

    @Override
    public Bookings findById(int bookingId) {
        return bookingsRepository.findById(bookingId);
    }

    @Override
    public List<Bookings> findByRoomId(String roomId) {
        return bookingsRepository.findByRoomId(roomId);
    }

    @Override
    public List<Bookings> findByCustomerId(String customerId) {
        return bookingsRepository.findByCustomerId(customerId);
    }

    @Override
    public List<Bookings> findByStatus(String status) {
        return bookingsRepository.findByStatus(status);
    }

    @Override
    public boolean updateStatus(int bookingId, String status) {
        return bookingsRepository.updateStatus(bookingId, status);
    }
}
