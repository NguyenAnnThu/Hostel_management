package com.example.case_study.controller;

import com.example.case_study.repository.IServicePriceConfigRepository;
import com.example.case_study.repository.ServicePriceConfigRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet (name="ServiceController", value="/service")
public class ServiceController extends HttpServlet {
    private final IServicePriceConfigRepository service = new ServicePriceConfigRepository();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("services", service.getAllServices());
        req.getRequestDispatcher("view/owner/services.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        Map<String, String> data = new HashMap<>();
        req.getParameterMap().forEach((k, v) -> data.put(k, v[0]));

        if ("update".equals(req.getParameter("action"))) {
            service.updateService(data);
        } else {
            service.createService(data);
        }

        resp.sendRedirect("view/owner/services.jsp");
    }
}
