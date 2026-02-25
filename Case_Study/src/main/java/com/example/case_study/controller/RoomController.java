package com.example.case_study.controller;

import com.example.case_study.entity.Bookings;
import com.example.case_study.entity.Rooms;
import com.example.case_study.service.BookingsService;
import com.example.case_study.service.RoomsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "RoomController", value = "/room")
public class RoomController extends HttpServlet {
    private RoomsService roomsService = new RoomsService();
    private BookingsService bookingsService = new BookingsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println("RoomController doGet chạy");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "search":
                searchRooms(req, resp);
                break;
            case "listRooms":
                listRooms(req, resp);
                break;
            case "viewDetailsRooms":
                viewDetailsRooms(req, resp);
                break;
            default:
                listRooms(req, resp); // mặc định cũng hiển thị list
        }
    }

    private void viewDetailsRooms(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roomId = req.getParameter("roomId");
        Rooms rooms = roomsService.findById(roomId);
        System.out.println("-------rooms: " + roomId);
        req.setAttribute("rooms", rooms);
        req.getRequestDispatcher("/view/user/detailsRoom.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "bookSlot":
                bookSlot(req, resp);
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/room");
        }
    }

    private void listRooms(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("");
        req.setAttribute("roomList", roomsService.getRoomList());
        req.getRequestDispatcher("/view/user/room.jsp").forward(req, resp);
    }

    private void searchRooms(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roomName = req.getParameter("roomName");
        String floorParam = req.getParameter("floor");
        Integer floor = null;

        if (floorParam != null && !floorParam.trim().isEmpty()) {
            try {
                floor = Integer.parseInt(floorParam);
            } catch (NumberFormatException e) {
                floor = null;
            }
        }

        List<Rooms> searchResults = roomsService.searchRooms(roomName, floor);
        req.setAttribute("roomList", searchResults);
        req.setAttribute("searchRoomName", roomName);
        req.setAttribute("searchFloor", floorParam);
        req.getRequestDispatcher("/view/user/room.jsp").forward(req, resp);
    }

    private void bookSlot(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roomId = req.getParameter("roomId");
        String customerId = req.getParameter("customerId");
        String bookingDateStr = req.getParameter("bookingDate");
        String expireDateStr = req.getParameter("expireDate");

        // Validate input
        if (roomId == null || customerId == null || bookingDateStr == null || expireDateStr == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"success\":false,\"message\":\"Thông tin không đầy đủ\"}");
            return;
        }

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date bookingDate = sdf.parse(bookingDateStr);
            Date expireDate = sdf.parse(expireDateStr);

            // Validate dates
            if (bookingDate.after(expireDate)) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write("{\"success\":false,\"message\":\"Ngày hết hạn phải sau ngày đặt\"}");
                return;
            }

            Bookings booking = new Bookings();
            booking.setRoomId(roomId);
            booking.setCustomerId(customerId);
            booking.setBookingDate(bookingDate);
            booking.setExpireDate(expireDate);
            booking.setStatus("pending");

            boolean success = bookingsService.addBooking(booking);

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            if (success) {
                resp.getWriter().write("{\"success\":true,\"message\":\"Đặt lịch hẹn thành công!\"}");
            } else {
                resp.getWriter().write("{\"success\":false,\"message\":\"Lỗi khi đặt lịch hẹn\"}");
            }
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"success\":false,\"message\":\"Lỗi: " + e.getMessage() + "\"}");
        }
    }

}