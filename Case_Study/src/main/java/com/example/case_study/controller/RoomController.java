package com.example.case_study.controller;

import com.example.case_study.entity.Rooms;
import com.example.case_study.service.RoomsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RoomController" , value = "/room")
public class RoomController extends HttpServlet {
    private RoomsService roomsService = new RoomsService();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println("RoomController doGet chạy");
        listRooms(req, resp);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "listRooms":
                listRooms(req, resp);
                break;
            default:
                listRooms(req, resp); // mặc định cũng hiển thị list
        }
    }

    private void listRooms(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("roomList", roomsService.getRoomList());
        req.getRequestDispatcher("/view/user/room.jsp").forward(req,resp);

    }


}
