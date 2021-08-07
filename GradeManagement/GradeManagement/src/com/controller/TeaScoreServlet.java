package com.controller;

import com.bean.StuScore;
import com.bean.UserTea;
import com.dao.CourseDao;
import com.dao.MyStuDao;
import com.dao.ScoreDao;
import com.dao.TermDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class TeaScoreServlet extends HttpServlet {

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

        List<StuScore> list = ScoreDao.queryStuScore("tea_id", userTea.getTeaId());
        float sum = 0;
        float avgScore = 0;
        if (!list.isEmpty()){
            int iSize = list.size();
            for (StuScore score: list) {
                if (score.getScore().equals("")){
//                    score.setScore("0");
                    iSize -= 1;
                    continue;   //未录入成绩的不计入总分
                }
                sum += Integer.parseInt(score.getScore());
            }
            avgScore = sum / iSize;
        }
        req.setAttribute("avgScore", avgScore);

        if (null == termN){
            if (null != courseName){
                list = ScoreDao.queryStuScore("c_name", courseName, userTea.getTeaId());
            }
        } else {
            if (null == courseName){
                list = ScoreDao.queryStuScore("c_term", termN, userTea.getTeaId());
            } else {
                list = ScoreDao.queryStuScore("c_tc", courseName, termN, userTea.getTeaId());
            }
        }

        req.setAttribute("teaScoreList", list);
        req.getRequestDispatcher("/jsp/teacher/score.jsp").forward(req, resp);
    }
}
