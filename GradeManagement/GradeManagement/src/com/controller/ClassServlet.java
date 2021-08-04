package com.controller;

import com.bean.Class;
import com.dao.ClassDao;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ClassServlet extends HttpServlet {
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
                getAllClass(req, resp);
                break;
            case "insert":
                insertClass(req, resp);
                break;
            case "deleteSel":
            case "delete":
                deleteClass(method, req, resp);
                break;
            case "update":
                updateClass(req, resp);
                break;
            default:
                break;
        }

    }

    private void updateClass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        PrintWriter pw = resp.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", false);
        jsonObject.put("message", "error!");

        String cNo = req.getParameter("cNo");
        String cName = req.getParameter("cName");
        String cId = req.getParameter("cId");

        List<Class> list1 = ClassDao.getClass("id", cId);
        Class aClass = list1.get(0);
        List<Class> list = ClassDao.getClass("cno", cNo);
        List<Class> list2 = ClassDao.getClass("cname", cName);
        if (!list.isEmpty() && !(aClass.getClaId()).equals(cNo)) {
            jsonObject.put("message", "班级编号已存在!");
        } else if (!list2.isEmpty() && !(aClass.getClaName()).equals(cName)) {
            jsonObject.put("message", "班级名称已存在!");
        } else {
            boolean rs = ClassDao.updateClass(cNo, cName, cId);
            if (rs) {
                jsonObject.put("success", true);
                jsonObject.put("message", "操作成功!");
            }
        }
        pw.print(jsonObject);
        pw.flush();
        pw.close();
    }

    private void deleteClass(String method, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");

        PrintWriter pw = resp.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", false);
        jsonObject.put("message", "error!");

        boolean rs = false;
        if (method.equals("delete")) {
            String sId = req.getParameter("sid");
            rs = ClassDao.deleteClass(sId);
        } else if (method.equals("deleteSel")) {
            String[] classBox= req.getParameterValues("classBox");
            if (classBox.length > 0) {
                for (String box : classBox) {
                    rs = ClassDao.deleteClass(box);
                    if (!rs) {
                        break;
                    }
                }
            }
        }

        if (rs) {
            jsonObject.put("success", true);
            jsonObject.put("message", "操作成功!");
        }
        pw.print(jsonObject);
        pw.flush();
        pw.close();
    }

    private void insertClass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        String cno = req.getParameter("cno");
        String cname = req.getParameter("cname");

        PrintWriter pw = resp.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", false);
        req.setAttribute("classList", ClassDao.getClass("all"));

        List<Class> list = ClassDao.getClass("cno", cno);
        if (!list.isEmpty()) {
            jsonObject.put("message", "班级编号已存在!");
            pw.print(jsonObject);
            pw.flush();
            return;
        }
        list.clear();
        list = ClassDao.getClass("cname", cname);
        if (!list.isEmpty()) {
            jsonObject.put("message", "班级名称已存在!");
            pw.print(jsonObject);
            pw.flush();
            return;
        }

        ClassDao.addClass(cno, cname);
        jsonObject.put("success", true);
        jsonObject.put("message", "操作成功!");
        pw.print(jsonObject);
        pw.flush();
    }

    private void getAllClass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("classList", ClassDao.getClass("all"));
        req.getRequestDispatcher("/jsp/admin/class.jsp").forward(req, resp);
    }
}
