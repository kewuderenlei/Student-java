package com.controller;

import com.dao.CourseDao;
import com.dao.TermDao;
import com.dao.UserTeaDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        String method = req.getServletPath().substring(14);
        System.out.println(method);

        switch (method) {
            case "all":
                getAllCourse(req, resp);
                break;
            case "insert":
                insertCourse(req, resp);
                break;
            default:
                break;
        }

    }

    private void insertCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String term = req.getParameter("insertTerm");
        String ID = req.getParameter("insertID");
        String name = req.getParameter("insertName");
        String teacher = req.getParameter("insertTeacher");
        String hours = req.getParameter("insertHours");
        String credit = req.getParameter("insertCredit");
        String type = req.getParameter("insertType");

        CourseDao.addCourse(ID, name, teacher, term, hours, type, credit);
        getAllCourse(req, resp);
    }

    private void getAllCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("termList", TermDao.queryAllTerm());
        req.setAttribute("courseList", CourseDao.queryTeaCourse("all"));
        req.setAttribute("teacherList", UserTeaDao.getUser("all"));
        req.getRequestDispatcher("/jsp/admin/course.jsp").forward(req, resp);
    }
}