package com.controller;

import com.bean.UserStu;
import com.dao.CourseDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class StuCourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        HttpSession session = req.getSession();
        UserStu stu = (UserStu)session.getAttribute("student");
        req.setAttribute("stuCourseList", CourseDao.queryStuCourse(stu.getUid()));
        req.getRequestDispatcher("/jsp/student/courses.jsp").forward(req, resp);
    }
}
