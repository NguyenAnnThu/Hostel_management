package com.example.case_study.controller;

import com.example.case_study.entity.User;
import com.example.case_study.repository.UserRepository;
import com.example.case_study.service.UserService;
import dto.UserDto;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/users")
public class UserController extends HttpServlet {

    private UserService userService = new UserService();
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("filter".equals(action)) {

            String status = request.getParameter("status");
            String keyword = request.getParameter("keyword");

            request.setAttribute("userList",
                    userService.filter(status, keyword));

        } else {
            request.setAttribute("userList",
                    userService.getAll());
        }

        request.getRequestDispatcher("/view/owner/users.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/users");
            return;
        }

        switch (action) {

            case "update":
                updateUser(request);
                response.sendRedirect(request.getContextPath() + "/users");
                return;

            case "delete":
                userService.delete(request.getParameter("userId"));
                break;

            case "lock":
                userService.updateStatus(request.getParameter("userId"), "locked");
                break;

            case "unlock":
                userService.updateStatus(request.getParameter("userId"), "active");
                break;
            case "view":
                String id = request.getParameter("userId");
                UserDto user = userService.findById(id);

                request.setAttribute("user", user);
                try {
                    request.getRequestDispatcher("/views/user-detail.jsp")
                            .forward(request, response);
                    return;
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
        }

        response.sendRedirect(request.getContextPath() + "/users");
    }

    private void updateUser(HttpServletRequest request) {

        try {

            String userId = request.getParameter("userId");
            System.out.println("Updating user: " + userId);

            UserDto user = new UserDto(
                    userId,
                    request.getParameter("fullName"),
                    request.getParameter("phone"), // nếu có
                    request.getParameter("email"),
                    request.getParameter("citizenId"),
                    request.getParameter("address"),
                    sdf.parse(request.getParameter("dateOfBirth")),
                    request.getParameter("status")
            );

            boolean result = userService.update(user);
            System.out.println("Update result: " + result);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}