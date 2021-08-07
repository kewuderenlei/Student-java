package com.controller;

import com.bean.User;
import com.bean.UserAdmin;
import com.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");
        HttpSession session = req.getSession();

        User ad = (User) session.getAttribute("loginUser");
        List<UserAdmin> listAd = UserDao.getAdmin("admin", ad.getAccId());
        if (session.getAttribute("admin") != null) {
            session.removeAttribute("admin");
        }
        session.setAttribute("admin", listAd.get(0));
        req.getRequestDispatcher("/jsp/admin/index.jsp").forward(req, resp);
    }
}
