package com.example.case_study.controller;

import com.example.case_study.service.AccountService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name="ForgetController",value="/forgot")
public class ForgetController extends HttpServlet {

    private final AccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/view/user/forgot.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String phone = req.getParameter("phone");
        String newPassword = req.getParameter("newPassword");

        String result = accountService.resetPassword(phone, newPassword);

        if (result != null) {
            req.setAttribute("error", result);
        } else {
            req.setAttribute("success", "Đổi mật khẩu thành công");
        }

        req.getRequestDispatcher("/view/owner/login.jsp").forward(req, resp);
    }
}
