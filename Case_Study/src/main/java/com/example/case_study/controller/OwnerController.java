package com.example.case_study.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "OwnerController", value = "/owner")
public class OwnerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");
        if (page == null) {
            page = "dashboard";
        }
        switch (page) {
            case "rooms":
                resp.sendRedirect(req.getContextPath() + "/owner/rooms");
                break;
            case "booking":
                resp.sendRedirect(req.getContextPath() + "/owner/bookings");
                break;
            case "contracts":
                resp.sendRedirect(req.getContextPath() + "/owner/contracts");
                break;
            case "invoices":
                resp.sendRedirect(req.getContextPath() + "/owner/invoices");
                break;
            case "reports":
                resp.sendRedirect(req.getContextPath() + "/owner/reports");
                break;
            case "dashboard":
            default:
                resp.sendRedirect(req.getContextPath() + "/owner/dashboard");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
