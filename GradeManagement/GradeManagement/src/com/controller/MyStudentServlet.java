package com.controller;

import com.bean.MyStu;
import com.bean.UserTea;
import com.dao.CourseDao;
import com.dao.MyStuDao;
import com.dao.TermDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class MyStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        req.setAttribute("termList", TermDao.queryAllTerm());
        HttpSession session = req.getSession();
        UserTea userTea = (UserTea)session.getAttribute("teacher");
        req.setAttribute("courseList", CourseDao.queryTeaCourse("tea_id", userTea.getTeaId()));

        String termN = req.getParameter("term");
        String courseName = req.getParameter("courseName");
        List<MyStu> list = null;
        if (null == termN){
            if (null != courseName){
                list = MyStuDao.queryTeaStu1("c_name", courseName, userTea.getTeaId());
            } else {
                list = MyStuDao.queryTeaStu1("tea_id", userTea.getTeaId());
            }
        } else {
            if (null == courseName){
                list = MyStuDao.queryTeaStu1("c_term", termN, userTea.getTeaId());
            } else {
                list = MyStuDao.queryTeaStu1("c_tc", courseName, termN, userTea.getTeaId());
            }
        }

        req.setAttribute("myStudentList", list);
        req.getRequestDispatcher("/jsp/teacher/myStudent.jsp").forward(req, resp);
    }
}
