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

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="InvoicesController", value="/invoices")
public class InvoicesController extends HttpServlet {
    private final IInvoicesService invoiceService = new InvoicesService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("invoices", invoiceService.getAll());
        req.getRequestDispatcher("/view/owner/invoices.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        Invoices invoice = new Invoices();
        invoice.setRoomId(req.getParameter("roomId"));
        invoice.setCustomerId(req.getParameter("customerId"));
        invoice.setMonth(Integer.parseInt(req.getParameter("month")));
        invoice.setYear(Integer.parseInt(req.getParameter("year")));
        invoice.setStatus("UNPAID");

        List<InvoiceDetails> details = new ArrayList<>();

        String[] serviceCodes = req.getParameterValues("serviceCode");
        String[] quantities = req.getParameterValues("quantity");
        String[] prices = req.getParameterValues("unitPrice");

        for (int i = 0; i < serviceCodes.length; i++) {
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
    }
}
