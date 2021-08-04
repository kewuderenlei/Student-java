package com.controller;

import com.bean.StuScore;
import com.bean.UserStu;
import com.dao.ScoreDao;
import com.dao.TermDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class StuScoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        //获取学期信息  存入req
        req.setAttribute("termList", TermDao.queryAllTerm());

        HttpSession session = req.getSession();
        UserStu stu = (UserStu)session.getAttribute("student");

        List<StuScore> list = null;
        String term = req.getParameter("term");
        if (null == term){
            list = ScoreDao.queryStuScore("s_no", stu.getUid());
        } else {
            list = ScoreDao.queryStuScore("s_term", term, stu.getUid());
        }


        req.setAttribute("stuScoreList", list);
        req.getRequestDispatcher("/jsp/student/score.jsp").forward(req, resp);
    }
}
