package com.example.case_study.controller;


import com.example.case_study.entity.Services;
import com.example.case_study.service.IServicesService;
import com.example.case_study.service.ServicesService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name="ServiceController", value="/services")
public class ServiceController extends HttpServlet {

    private final ServicesService service = new ServicesService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("services", service.getAllWithPrice());
        req.getRequestDispatcher("/view/owner/services.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String serviceCode = req.getParameter("serviceCode");

        // 🔥 THÊM MỚI → SINH CODE
        if (serviceCode == null || serviceCode.isBlank()) {
            serviceCode = generateServiceCode(req.getParameter("serviceName"));
        }

        Services s = new Services(
                serviceCode,
                req.getParameter("serviceName"),
                req.getParameter("serviceType"),
                req.getParameter("unit"),
                0,
                req.getParameter("status")
        );

        double price = Double.parseDouble(req.getParameter("defaultPrice"));
        service.saveOrUpdate(s, price);

        resp.sendRedirect(req.getContextPath() + "/services");
    }

    private String generateServiceCode(String name) {
        return name
                .trim()
                .toUpperCase()
                .replaceAll("[^A-Z0-9]", "");
    }
}