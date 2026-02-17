package com.example.case_study.controller;

import com.example.case_study.service.AccountService;
import com.example.case_study.service.IAccountService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name="RegisterController", value="/register")
public class RegisterController extends HttpServlet {
    private final IAccountService accountService = new AccountService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/user/register.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("fullName");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            String citizenId = req.getParameter("citizenId");
            String address = req.getParameter("address");
            String password = req.getParameter("password");

            Date dob = new SimpleDateFormat("yyyy-MM-dd")
                    .parse(req.getParameter("dob"));

            String error = accountService.register(fullName, phone, email, citizenId, address, dob, password);

            if (error != null) {
                req.setAttribute("error", error);
                req.getRequestDispatcher("view/user/register.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "view/owner/login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Đăng ký thất bại");
            req.getRequestDispatcher("view/user/register.jsp").forward(req, resp);
        }
    }
}
