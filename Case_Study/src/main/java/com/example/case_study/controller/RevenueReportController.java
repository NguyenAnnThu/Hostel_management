package com.example.case_study.controller;

import com.example.case_study.service.IRevenueReportService;
import com.example.case_study.service.RevenueReportService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="RevenueReport",value="/dashboard")
public class RevenueReportController extends HttpServlet {
    private final IRevenueReportService service = new RevenueReportService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("totalRooms", service.getTotalRooms());
        req.setAttribute("availableRooms", service.getAvailableRooms());
        req.setAttribute("rentedRooms", service.getRentedRooms());
        req.setAttribute("pendingBookings", service.getPendingBookings());
        req.setAttribute("maintenanceRooms", service.getMaintenanceRooms());
        req.setAttribute("unpaidInvoices", service.getUnpaidInvoices());
        req.setAttribute("monthlyRevenue", service.getLatestMonthRevenue());
        req.setAttribute("chartData", service.getLast3MonthsRevenue());


        req.getRequestDispatcher("/view/owner/dashboard.jsp").forward(req, resp);
    }
}

