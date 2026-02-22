package com.example.case_study.controller;

import com.example.case_study.entity.Account;
import com.example.case_study.entity.User;
import com.example.case_study.service.AccountService;
import com.example.case_study.service.IAccountService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private final IAccountService service = new AccountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        Account account = service.login(phone, password);

        if (account == null) {
            req.setAttribute("error", "Invalid phone or password");
            req.getRequestDispatcher("/view/owner/login.jsp").forward(req, resp);
            return;
        }

        if ("locked".equals(account.getUser().getStatus())) {
            req.setAttribute("error", "Account is locked");
            req.getRequestDispatcher("/view/owner/login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("account", account);

        switch (account.getRole()) {
            case "ADMIN":
                resp.sendRedirect(req.getContextPath() + "/view/owner/dashboard.jsp");
                break;
            case "TENANT":
                resp.sendRedirect(req.getContextPath() + "/view/user/home.jsp");
                break;
            default:
                req.setAttribute("error", "Role not supported");
                req.getRequestDispatcher("/view/owner/login.jsp").forward(req, resp);
        }
    }
}
