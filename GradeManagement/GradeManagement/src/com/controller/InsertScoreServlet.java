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

public class InsertScoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        String[] stuNo = req.getParameterValues("sNo");
        String[] termNo = req.getParameterValues("tNo");
        String[] courseNo = req.getParameterValues("cNo");
        String[] teaId = req.getParameterValues("teaId");
        String[] score = req.getParameterValues("score");
        String size = req.getParameter("size");

        if ((stuNo == null || stuNo.length <= 0) || (termNo == null || termNo.length <= 0) ||
                (courseNo == null || courseNo.length <= 0) || (teaId == null || teaId.length <= 0) ||
                (score == null || score.length <= 0) || (size.isEmpty())){
            req.getRequestDispatcher("/jsp/teacher/scoreInsert.jsp").forward(req, resp);
            return;
        }
        ScoreDao.updateScore(score, stuNo, termNo, courseNo, teaId, size);

        req.setAttribute("termList", TermDao.queryAllTerm());
        HttpSession session = req.getSession();
        UserTea userTea = (UserTea)session.getAttribute("teacher");
        req.setAttribute("courseList", CourseDao.queryTeaCourse("tea_id", userTea.getTeaId()));


        req.setAttribute("myStuToInsertScoreList", ScoreDao.queryStuScore("tea_id", userTea.getTeaId()));
        req.getRequestDispatcher("/jsp/teacher/scoreInsert.jsp").forward(req, resp);
    }
}
