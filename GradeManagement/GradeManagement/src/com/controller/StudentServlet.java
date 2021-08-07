package com.controller;

import com.dao.ClassDao;
import com.dao.CollegeDao;
import com.dao.UserDao;
import com.dao.UserStuDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class StudentServlet extends HttpServlet {
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
                getAllStu(req, resp);
                break;
            case "insert":
                insertStu(req, resp);
                break;
//            case "deleteSel":
//            case "delete":
//                deleteStu(method, req, resp);
//                break;
//            case "update":
//                updateStu(req, resp);
//                break;
            default:
                break;
        }

    }

    private void insertStu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ID = req.getParameter("insertID");
        String name = req.getParameter("insertName");
        String departmentName = req.getParameter("insertDepartmentName");
        String className = req.getParameter("insertClassName");
        String sex = req.getParameter("insertSex");
        String age = req.getParameter("insertAge");
        String address = req.getParameter("insertAddress");

        UserDao.addUser(ID, name, className, departmentName, sex, "", "1", age, address);
        getAllStu(req, resp);
    }

    private void getAllStu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("studentList", UserStuDao.getUser("all"));
        req.setAttribute("classList", ClassDao.getClass("all"));
        req.setAttribute("departmentList", CollegeDao.getCollege("all"));

        req.getRequestDispatcher("/jsp/admin/student.jsp").forward(req, resp);
    }
}