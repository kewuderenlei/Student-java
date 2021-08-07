package com.controller;

import com.bean.Type;
import com.bean.User;
import com.dao.TypeDao;
import com.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        HttpSession session = req.getSession();
        String method = req.getParameter("flag");
        System.out.println(method);
        switch (method) {
            case "checkLogin":
                checkLogin(method, req, resp, session);
                break;
            case "intoLogin":
                intoLogin(req, resp, session);
                break;
            default:
                break;
        }
    }

    //登录验证
    private void checkLogin(String flag, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws ServletException, IOException {
        PrintWriter pw = null;
        String username = req.getParameter("username");
        String pwd = req.getParameter("userpwd");
        String role = req.getParameter("role");

        if (role == null || role.equals("")) {
            session.setAttribute("message", "请选择登录类型!");
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
            return;
        }

        //查询用户是否存在
        List<User> list = UserDao.getUser(flag, username, pwd, role);
        if (!list.isEmpty()) {
            if (session.getAttribute("loginUser") != null) {
                session.removeAttribute("loginUser");
            }
            session.setAttribute("loginUser", list.get(0));
            if (session.getAttribute("message") != null) {
                session.removeAttribute("message");
            }
            session.setAttribute("message", null);
            if (role.equals("学生")) {
                req.getRequestDispatcher("/student/index").forward(req, resp);
            } else if (role.equals("教师")) {
                req.getRequestDispatcher("/teacher/index").forward(req, resp);
            } else if (role.equals("管理员")) {
                req.getRequestDispatcher("/admin/index").forward(req, resp);
            }
        } else {
            session.setAttribute("message", "账号或密码错误!");
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
        }
    }

    private void intoLogin(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws ServletException, IOException {

        String[] strs = {"loginUser", "student", "teacher"};
        for (int i = 0; i < strs.length; i++) {
            session.setAttribute(strs[i], null);
        }

        List<Type> list = TypeDao.getType();
        if (!list.isEmpty()) {
            session.setAttribute("typelist", list);
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
        }
    }
}
