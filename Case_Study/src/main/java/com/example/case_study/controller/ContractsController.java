package com.example.case_study.controller;

import com.example.case_study.entity.Contracts;
import com.example.case_study.service.ContractsDtoService;
import com.example.case_study.service.ContractsService;
import com.example.case_study.service.RoomsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "ContractsController", value = "/contract")
public class ContractsController extends HttpServlet {
    private RoomsService roomsService = new RoomsService();
    private ContractsDtoService contractsService = new ContractsDtoService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("contractsList", contractsService.getAllContracts());
        req.setAttribute("roomList", roomsService.getRoomList()); // thêm dòng này
        req.getRequestDispatcher("/view/owner/contracts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("update".equals(action)) {
            updateContract(req, resp);
        } else if ("add".equals(action)) {
            addContract(req, resp);
        }else if ("delete".equals(action)) {
            deleteContract(req, resp);
        }
    }

    private void addContract(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String roomId = req.getParameter("roomId");
        String customerId = req.getParameter("customerId");
        LocalDate startDate = LocalDate.parse(req.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(req.getParameter("endDate"));
        double deposit = Double.parseDouble(req.getParameter("deposit"));
        String status = req.getParameter("status");

        contractsService.addContract(
                roomId, customerId, startDate, endDate, deposit, status
        );

        resp.sendRedirect(req.getContextPath() + "/contract");
    }

    private void updateContract(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("contractId"));
        String roomId = req.getParameter("roomId");
        String customerId = req.getParameter("customerId");
        LocalDate startDate = LocalDate.parse(req.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(req.getParameter("endDate"));
        double deposit = Double.parseDouble(req.getParameter("deposit"));
        String status = req.getParameter("status");

        contractsService.updateContract(
                id, roomId, customerId, startDate, endDate, deposit, status
        );

        resp.sendRedirect(req.getContextPath() + "/contract?action=listContracts");
    }

    private void deleteContract(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("contractId"));

        contractsService.deleteContract(id);

        resp.sendRedirect(req.getContextPath() + "/contract");
    }
}
