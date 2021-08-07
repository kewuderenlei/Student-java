package com.controller;

import com.bean.UserTea;
import com.dao.CourseDao;
import com.dao.ScoreDao;
import com.dao.TermDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyStuToInsertScoreServlet extends HttpServlet {

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
        req.setAttribute("myStuToInsertScoreList", ScoreDao.queryStuScore("tea_id", userTea.getTeaId()));
        req.getRequestDispatcher("/jsp/teacher/scoreInsert.jsp").forward(req, resp);
    }
}
