package com.example.case_study.controller;

import com.example.case_study.entity.Account;
import com.example.case_study.entity.User;
import com.example.case_study.service.AccountService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet (name="AccountController" , value="/account")
public class AccountController extends HttpServlet {
    private AccountService accountService = new AccountService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "profile":
                showProfile(req, resp);
                break;

            case "logout":
                logout(req, resp);
                break;

            default:
                req.getRequestDispatcher("/view/owner/login.jsp")
                        .forward(req, resp);
        }
    }


    private void showProfile(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/view/owner/login.jsp");
            return;
        }

        Account sessionAcc = (Account) session.getAttribute("account");
        if (sessionAcc == null) {
            resp.sendRedirect(req.getContextPath() + "/view/owner/login.jsp");
            return;
        }
        Account fullAcc = accountService.getByPhone(sessionAcc.getPhone());
        if (fullAcc == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Account not found");
            return;
        }

        req.setAttribute("account", fullAcc);
        req.setAttribute("user", fullAcc.getUser());

        req.getRequestDispatcher("/view/user/profile.jsp")
                .forward(req, resp);
    }


    private void logout(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session != null) session.invalidate();

        resp.sendRedirect(req.getContextPath() + "/view/owner/login.jsp");
    }
}
