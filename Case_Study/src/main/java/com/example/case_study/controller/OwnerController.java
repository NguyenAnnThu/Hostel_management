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
                resp.sendRedirect(req.getContextPath() + "/contract");
                break;
            case "invoices":
                resp.sendRedirect(req.getContextPath() + "/invoices");
                break;
            case "utilities":
                resp.sendRedirect(req.getContextPath() + "/utilities");
                break;
            case "services":
                resp.sendRedirect(req.getContextPath() + "/services");
                break;
            case "users":
                resp.sendRedirect(req.getContextPath() + "/users");
                break;
            case "reports":
                resp.sendRedirect(req.getContextPath() + "/owner/reports");
                break;
            case "dashboard":
            default:
                resp.sendRedirect(req.getContextPath() + "/dashboard");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
