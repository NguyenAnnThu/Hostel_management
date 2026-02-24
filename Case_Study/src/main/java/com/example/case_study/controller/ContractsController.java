package com.example.case_study.controller;

import com.example.case_study.entity.Contracts;
import com.example.case_study.service.ContractsDtoService;
import com.example.case_study.service.ContractsService;
import com.example.case_study.service.RoomsService;
import dto.ContractDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "ContractsController", value = "/contract")
public class ContractsController extends HttpServlet {
    private RoomsService roomsService = new RoomsService();
    private ContractsDtoService contractsService = new ContractsDtoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("filter".equals(action)) {
            String status = request.getParameter("status");
            String roomId = request.getParameter("roomId");

                List<ContractDTO> list = contractsService.filterContracts(status, roomId);

            request.setAttribute("contractsList", list);
            request.setAttribute("roomList", roomsService.getRoomList());

            request.getRequestDispatcher("/view/owner/contracts.jsp").forward(request, resp);
            return;
        }
        request.setAttribute("contractsList", contractsService.getAllContracts());
        request.setAttribute("roomList", roomsService.getRoomList()); // thêm dòng này
        request.getRequestDispatcher("/view/owner/contracts.jsp").forward(request, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("update".equals(action)) {
            updateContract(req, resp);
        } else if ("add".equals(action)) {
            addContract(req, resp);
        } else if ("delete".equals(action)) {
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

        boolean added = contractsService.addContract(
                roomId, customerId, startDate, endDate, deposit, status
        );

        if (added) {
            roomsService.updateRoomStatus(roomId, "Đang thuê");
        }

        resp.sendRedirect(req.getContextPath() + "/contract");
    }

    private void updateContract(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        int id = Integer.parseInt(req.getParameter("contractId"));
        String newRoomId = req.getParameter("roomId");

        // Lấy hợp đồng cũ
        ContractDTO oldContract = contractsService.getAllContracts()
                .stream()
                .filter(c -> c.getContractId() == id)
                .findFirst()
                .orElse(null);

        String oldRoomId = oldContract != null ? oldContract.getRoomId() : null;

        String customerId = req.getParameter("customerId");
        LocalDate startDate = LocalDate.parse(req.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(req.getParameter("endDate"));
        double deposit = Double.parseDouble(req.getParameter("deposit"));
        String status = req.getParameter("status");

        boolean updated = contractsService.updateContract(
                id, newRoomId, customerId, startDate, endDate, deposit, status
        );

        if (updated) {

            // Nếu đổi phòng
            if (oldRoomId != null && !oldRoomId.equals(newRoomId)) {

                roomsService.updateRoomStatus(oldRoomId, "Còn trống");
                roomsService.updateRoomStatus(newRoomId, "Đang thuê");

            }
        }

        resp.sendRedirect(req.getContextPath() + "/contract");
    }

    private void deleteContract(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        int id = Integer.parseInt(req.getParameter("contractId"));

        // Lấy roomId trước khi xoá
        ContractDTO contract = contractsService.getAllContracts()
                .stream()
                .filter(c -> c.getContractId() == id)
                .findFirst()
                .orElse(null);

        if (contract != null) {
            boolean deleted = contractsService.deleteContract(id);

            if (deleted) {
                roomsService.updateRoomStatus(contract.getRoomId(), "Còn trống");
            }
        }

        resp.sendRedirect(req.getContextPath() + "/contract");
    }
}
