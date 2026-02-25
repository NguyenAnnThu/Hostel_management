package com.example.case_study.controller;

import com.example.case_study.entity.InvoiceDetails;
import com.example.case_study.entity.Invoices;
import com.example.case_study.service.IInvoicesService;
import com.example.case_study.service.InvoicesService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "InvoicesController", value = "/invoices")
public class InvoicesController extends HttpServlet {
    private final IInvoicesService invoiceService = new InvoicesService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "filter":
                filterInvoices(req, resp);
                break;
            default:
                showListInvoices(req, resp);
                break;
        }
    }

    private void showListInvoices(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("invoices", invoiceService.getAll());
        req.setAttribute("statusList", invoiceService.getAllStatus());
        req.setAttribute("roomIdList", invoiceService.getAllRoomId());
        req.setAttribute("activeContracts",  invoiceService.getActiveContracts());
        req.getRequestDispatcher("/view/owner/invoices.jsp").forward(req, resp);
    }

    private void filterInvoices(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String searchMonth = req.getParameter("searchMonth");
        String searchStatus = req.getParameter("searchStatus");
        String searchRoomId = req.getParameter("searchRoomId");
        String searchInvoiceId = req.getParameter("searchInvoiceId");

        Integer month = null;
        Integer year = null;

        try {
            if (searchMonth != null && !searchMonth.isEmpty()) {
                String[] monthYear = searchMonth.split("-");
                year = Integer.parseInt(monthYear[0]);
                month = Integer.parseInt(monthYear[1]);
            }

            req.setAttribute("invoices", invoiceService.filter(month, year, searchStatus, searchRoomId, searchInvoiceId));
            req.setAttribute("statusList", invoiceService.getAllStatus());
            req.setAttribute("roomIdList", invoiceService.getAllRoomId());
            req.setAttribute("activeContracts",  invoiceService.getActiveContracts());

            req.setAttribute("currentMonth", searchMonth);
            req.setAttribute("selectedStatus", searchStatus);
            req.setAttribute("selectedRoomId", searchRoomId);
            req.setAttribute("selectedInvoiceId", searchInvoiceId);

            req.getRequestDispatcher("/view/owner/invoices.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath()+"/invoices");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        try {
            Invoices invoice = new Invoices();
            invoice.setContractId(Integer.parseInt(req.getParameter("contractId")));
            invoice.setRoomId(req.getParameter("roomId"));
            invoice.setCustomerId(req.getParameter("customerId"));
            invoice.setMonth(Integer.parseInt(req.getParameter("month")));
            invoice.setYear(Integer.parseInt(req.getParameter("year")));
            invoice.setStatus("UNPAID");

            List<InvoiceDetails> details = new ArrayList<>();

            String[] serviceCodes = req.getParameterValues("serviceCode");
            String[] quantities = req.getParameterValues("quantity");
            String[] prices = req.getParameterValues("unitPrice");

            if (serviceCodes == null || serviceCodes.length == 0) {
                throw new IllegalArgumentException("Phải có ít nhất 1 dịch vụ");
            }

            for (int i = 0; i < serviceCodes.length; i++) {
                if (serviceCodes[i] == null || serviceCodes[i].isBlank()) continue;
                details.add(new InvoiceDetails(
                        0,
                        0,
                        serviceCodes[i],
                        Integer.parseInt(quantities[i]),
                        Double.parseDouble(prices[i])
                ));
            }

            invoiceService.createInvoice(invoice, details);
            resp.sendRedirect(req.getContextPath() + "/invoices");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "Tạo hóa đơn thất bại: " + e.getMessage());
            req.setAttribute("invoices", invoiceService.getAll());
            req.setAttribute("statusList", invoiceService.getAllStatus());
            req.setAttribute("roomIdList", invoiceService.getAllRoomId());
            req.setAttribute("activeContracts",  invoiceService.getActiveContracts());
            req.setAttribute("openModal", true);
            req.getRequestDispatcher("/view/owner/invoices.jsp").forward(req, resp);
        }

    }
}
