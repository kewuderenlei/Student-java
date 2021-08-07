package com.controller;

import com.bean.User;
import com.bean.UserStu;
import com.dao.UserStuDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class StuInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");
        HttpSession session = req.getSession();

        User stu = (User) session.getAttribute("loginUser");
        List<UserStu> listStu = UserStuDao.getUser("uid", stu.getAccId());
        if (session.getAttribute("student") != null) {
            session.removeAttribute("student");
        }
        session.setAttribute("student", listStu.get(0));
        req.getRequestDispatcher("/jsp/student/index.jsp").forward(req, resp);
    }
}
