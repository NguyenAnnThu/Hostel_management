package com.example.case_study.controller;

import com.example.case_study.service.IInvoicesService;
import com.example.case_study.service.IInvoiceDetailsService;
import com.example.case_study.service.InvoicesService;
import com.example.case_study.service.InvoiceDetailsService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/invoice-detail")
public class InvoiceDetailController extends HttpServlet {

    private final IInvoicesService invoicesService = new InvoicesService();
    private final IInvoiceDetailsService invoiceDetailsService =
            new InvoiceDetailsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        // ✅ Validate input
        if (idParam == null || idParam.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/invoices");
            return;
        }

        int invoiceId;
        try {
            invoiceId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/invoices");
            return;
        }

        // ✅ Load invoice
        req.setAttribute("invoice",
                invoicesService.findById(invoiceId));

        // ✅ Load invoice details
        req.setAttribute("details",
                invoiceDetailsService.findByInvoiceId(invoiceId));

        // ✅ Forward
        req.getRequestDispatcher("/view/owner/invoice-detail.jsp")
                .forward(req, resp);
    }
}