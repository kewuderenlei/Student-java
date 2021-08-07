package com.controller;

import com.dao.PositionDao;
import com.dao.UserDao;
import com.dao.UserTeaDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TeacherServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        String method = req.getServletPath().substring(15);
        System.out.println(method);

        switch (method) {
            case "all":
                getAllTea(req, resp);
                break;
            case "insert":
                insertTea(req, resp);
                break;
            default:
                break;
        }

    }

    private void insertTea(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ID = req.getParameter("ID");
        String name = req.getParameter("name");
        String sex = req.getParameter("sex");
        String age = req.getParameter("age");
        String title = req.getParameter("title");
        String phone = req.getParameter("phone");

        UserDao.addUser(ID, name, title, phone, sex, "", "0", age, null);
        getAllTea(req, resp);
    }

    private void getAllTea(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("positionList", PositionDao.getPosition("all"));
        req.setAttribute("teacherList", UserTeaDao.getUser("all"));
        req.getRequestDispatcher("/jsp/admin/teacher.jsp").forward(req, resp);

    }
}