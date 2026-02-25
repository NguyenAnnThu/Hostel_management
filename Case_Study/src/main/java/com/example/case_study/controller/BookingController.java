package com.example.case_study.controller;

import com.example.case_study.service.BookingsService;
import com.example.case_study.service.IBookingsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "BookingController", value = "/owner/bookings")
public class BookingController extends HttpServlet {

    private final IBookingsService bookingsService = new BookingsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "filter":
                filterBookings(req, resp);
                break;
            default:
                showList(req, resp);
                break;
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("bookings", bookingsService.getAllBookings());
        req.setAttribute("statusList", bookingsService.getAllStatus());
        forward(req, resp);
    }

    private void filterBookings(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String status  = req.getParameter("searchStatus");
        String keyword = req.getParameter("searchKeyword");

        req.setAttribute("bookings", bookingsService.filter(status, keyword));
        req.setAttribute("statusList", bookingsService.getAllStatus());
        req.setAttribute("selectedStatus", status);
        req.setAttribute("searchKeyword", keyword);
        forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String action    = req.getParameter("action");
        int    bookingId = Integer.parseInt(req.getParameter("bookingId"));

        switch (action) {
            case "confirm":
                bookingsService.confirmBooking(bookingId);
                break;
            case "cancel":
                bookingsService.cancelBooking(bookingId);
                break;
        }
        resp.sendRedirect(req.getContextPath() + "/owner/bookings");
    }

    private void forward(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/view/owner/bookings.jsp").forward(req, resp);
    }
}