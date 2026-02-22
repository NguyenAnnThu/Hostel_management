package com.example.case_study.controller;

import com.example.case_study.entity.Rooms;
import com.example.case_study.service.IRoomsService;
import com.example.case_study.service.RoomOwnerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "RoomController", value = {"/owner/rooms", "/owner/phong"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 5 * 1024 * 1024,    // 5MB
        maxRequestSize = 10 * 1024 * 1024 // 10MB
)
public class RoomOwnerController extends HttpServlet {
    private IRoomsService roomsService = new RoomOwnerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                break;
            case "filter":
                filterRooms(req, resp);
                break;
            case "view-detail":
                viewRoomDetail(req, resp);
                break;
            default:
                showRoomList(req, resp);
                break;
        }
    }

    private void viewRoomDetail(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String roomId = req.getParameter("id");
        Rooms room = roomsService.findById(roomId);

        if (room == null) {
            resp.sendRedirect(req.getContextPath() + "/owner/rooms");
            return;
        }

        req.setAttribute("room", room);
        req.getRequestDispatcher("/view/owner/room-detail.jsp").forward(req, resp);
    }

    private void filterRooms(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            String floorParam    = req.getParameter("searchFloor");
            String statusParam   = req.getParameter("searchStatus");
            String minPriceStr   = req.getParameter("searchMinPrice");
            String maxPriceStr   = req.getParameter("searchMaxPrice");
            String roomCodeSearchParam = req.getParameter("roomCodeSearch");

            int floor = (floorParam != null && !floorParam.isEmpty()) ? Integer.parseInt(floorParam) : 0;
            String status = (statusParam != null && !statusParam.isEmpty()) ? statusParam : "";
            double minPrice = (minPriceStr != null && !minPriceStr.isEmpty()) ? Double.parseDouble(minPriceStr) : 0;
            double maxPrice = (maxPriceStr != null && !maxPriceStr.isEmpty()) ? Double.parseDouble(maxPriceStr) : Double.MAX_VALUE;
            String roomCodeSearch = (roomCodeSearchParam != null && !roomCodeSearchParam.isEmpty()) ? roomCodeSearchParam : "";

            req.setAttribute("roomList", roomsService.filterRooms(floor, status, minPrice, maxPrice, roomCodeSearch));
            req.setAttribute("floorList", roomsService.getAllFloors());
            req.setAttribute("statusList", roomsService.getAllStatus());

            req.setAttribute("selectedFloor",    floorParam);
            req.setAttribute("selectedStatus",   statusParam);
            req.setAttribute("selectedMinPrice", minPriceStr);
            req.setAttribute("selectedMaxPrice", maxPriceStr);
            req.setAttribute("selectedRoomId",   roomCodeSearch);

            req.getRequestDispatcher("/view/owner/rooms.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath()+"/owner/rooms");
        }
    }

    private void showRoomList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("roomList", roomsService.getAllRoomsDTO());
        req.setAttribute("floorList", roomsService.getAllFloors());
        req.setAttribute("statusList", roomsService.getAllStatus());
        req.getRequestDispatcher("/view/owner/rooms.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addRoom(req, resp);
                break;
            case "update":
                updateRoom(req, resp);
                break;
            case "delete":
                deleteRoom(req, resp);
                break;
            default:
                showRoomList(req, resp);
        }
    }

    private void updateRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            String roomId = req.getParameter("roomId");
            int floor = Integer.parseInt(req.getParameter("floor"));
            double area = Double.parseDouble(req.getParameter("area"));
            double price = Double.parseDouble(req.getParameter("price"));
            int maxOccupants = Integer.parseInt(req.getParameter("maxOccupants"));
            String status = req.getParameter("status");
            String description = req.getParameter("description");

            Part imagePart = req.getPart("image");
            String fileName = null;
            long fileSize = 0;
            if (imagePart != null && imagePart.getSize() > 0) {
                fileName = imagePart.getSubmittedFileName();
                fileSize = imagePart.getSize();
            }

            String existingImage = null;
            if (fileName == null) {
                Rooms existing = roomsService.findById(roomId);
                if (existing != null) existingImage = existing.getImage();
            }
            Rooms updateRoom = new Rooms(roomId, floor, area, price, maxOccupants, description, status, fileName != null ? fileName : existingImage, null, null);

            Map<String, String> errorMap = roomsService.updateRoom(updateRoom, fileName, fileSize);

            if (errorMap == null || errorMap.isEmpty()) {
                if (imagePart != null && fileName != null) {
                    saveImage(imagePart, fileName);
                }
                resp.sendRedirect(req.getContextPath() + "/owner/rooms");
            } else {
                req.setAttribute("errorMap", errorMap);
                req.setAttribute("floorList", roomsService.getAllFloors());
                req.setAttribute("statusList", roomsService.getAllStatus());
                req.setAttribute("inputRoom", updateRoom);
                req.getRequestDispatcher("/view/owner/rooms.jsp").forward(req, resp);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            req.setAttribute("errorMap", Map.of("systemError", "Dữ liệu nhập không hợp lệ."));
            req.setAttribute("roomList", roomsService.getAllRoomsDTO());
            req.setAttribute("floorList", roomsService.getAllFloors());
            req.setAttribute("statusList", roomsService.getAllStatus());
            req.getRequestDispatcher("/view/owner/rooms.jsp").forward(req, resp);
        }
    }

    private void deleteRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String roomId = req.getParameter("roomId");
        Map<String, String> errorMap = roomsService.deleteRoom(roomId);

        if (errorMap == null || errorMap.isEmpty()) {
            resp.sendRedirect(req.getContextPath()+"/owner/rooms");
        } else {
            req.setAttribute("errorMap", errorMap);
            req.setAttribute("roomList", roomsService.getAllRoomsDTO());
            req.setAttribute("floorList", roomsService.getAllFloors());
            req.setAttribute("statusList", roomsService.getAllStatus());
            req.getRequestDispatcher("/view/owner/rooms.jsp").forward(req, resp);
        }
    }

    private void saveImage(Part imagePart, String fileName) throws IOException {
        String uploadPath = getServletContext().getRealPath("/uploads/rooms/");
        System.out.println("=== Upload path: " + uploadPath);
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();
        imagePart.write(uploadPath + File.separator + fileName);
    }

    private void addRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {
            String roomId = req.getParameter("roomId");
            int floor = Integer.parseInt(req.getParameter("floor"));
            Double area = Double.parseDouble(req.getParameter("area"));
            Double price = Double.parseDouble(req.getParameter("price"));
            int maxOccupants = Integer.parseInt(req.getParameter("maxOccupants"));
            String status = req.getParameter("status");
            String description = req.getParameter("description");

            Part imagePart = req.getPart("image");
            String fileName = null;
            long fileSize = 0;
            if (imagePart != null && imagePart.getSize() > 0) {
                fileName = imagePart.getSubmittedFileName();
                fileSize = imagePart.getSize();
            }


            Rooms insertRoom = new Rooms(roomId, floor, area, price, maxOccupants, description, status, fileName, null, null);

            Map<String, String> errorMap = roomsService.addRoom(insertRoom, fileName, fileSize);

            if (errorMap == null || errorMap.isEmpty()) {
                if (imagePart != null && fileName != null) {
                    saveImage(imagePart, fileName);
                }
                resp.sendRedirect(req.getContextPath() + "/owner/rooms");
            } else {
                req.setAttribute("errorMap", errorMap);
                req.setAttribute("floorList", roomsService.getAllFloors());
                req.setAttribute("statusList", roomsService.getAllStatus());
                req.setAttribute("inputRoom", insertRoom);
                req.getRequestDispatcher("/view/owner/rooms.jsp").forward(req, resp);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            req.setAttribute("errorMap", Map.of("systemError", "Dữ liệu nhập không hợp lệ."));
            req.setAttribute("roomList", roomsService.getAllRoomsDTO());
            req.setAttribute("floorList", roomsService.getAllFloors());
            req.setAttribute("statusList", roomsService.getAllStatus());
            req.getRequestDispatcher("/view/owner/rooms.jsp").forward(req, resp);
        }
    }
}
