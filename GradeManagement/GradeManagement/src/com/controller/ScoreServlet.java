package com.controller;

import com.dao.ScoreDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ScoreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        String method = req.getServletPath().substring(13);
        System.out.println(method);

        switch (method) {
            case "all":
                getAllScore(req, resp);
                break;
//            case "insert":
//                insertScore(req, resp);
//                break;
            default:
                break;
        }

    }

    private void getAllScore(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("scoreList", ScoreDao.queryStuScore("all"));
        req.getRequestDispatcher("/jsp/admin/score.jsp").forward(req, resp);
    }
}