package com.controller;

import com.bean.College;
import com.dao.CollegeDao;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class DepartmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        String method = req.getServletPath().substring(18);
        System.out.println(method);

        switch (method) {
            case "all":
                getAllDept(req, resp);
                break;
            case "insert":
                insertDept(req, resp);
                break;
            case "deleteSel":
            case "delete":
                deleteDept(method, req, resp);
                break;
            case "update":
                updateDept(req, resp);
                break;
            default:
                break;
        }

    }

    private void updateDept(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        PrintWriter pw = resp.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", false);
        jsonObject.put("message", "error!");

        String cNo = req.getParameter("collNo");
        String cName = req.getParameter("collName");
        String cId = req.getParameter("collId");

        List<College> list1 = CollegeDao.getCollege("id", cId);
        College college = list1.get(0);
        List<College> list = CollegeDao.getCollege("cno", cNo);
        List<College> list2 = CollegeDao.getCollege("name", cName);
        if (!list.isEmpty() && !(college.getCollId()).equals(cNo)) {
            jsonObject.put("message", "院系编号已存在!");
        } else if (!list2.isEmpty() && !(college.getCollName()).equals(cName)) {
            jsonObject.put("message", "院系名称已存在!");
        } else {
            boolean rs = CollegeDao.updateCollege(cNo, cName, cId);
            if (rs) {
                jsonObject.put("success", true);
                jsonObject.put("message", "操作成功!");
            }
        }
        pw.print(jsonObject);
        pw.flush();
        pw.close();
    }

    private void deleteDept(String method, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        PrintWriter pw = resp.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", false);
        jsonObject.put("message", "error!");

        boolean rs = false;
        if (method.equals("delete")) {
            String sId = req.getParameter("sid");
            rs = CollegeDao.deleteCollege(sId);
//            String[] sId = req.getParameterValues("sid");
//            for (String box : sId) {
//                System.out.println(box);
//            }
        } else if (method.equals("deleteSel")) {
            String[] deptBox = req.getParameterValues("deptBox");
            if (deptBox.length > 0) {
                for (String box : deptBox) {
                    rs = CollegeDao.deleteCollege(box);
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

    private void insertDept(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("application/json");
        String ID = req.getParameter("ID");
        String name = req.getParameter("name");

        PrintWriter pw = resp.getWriter();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", false);
        req.setAttribute("departmentList", CollegeDao.getCollege("all"));

        List<College> list = CollegeDao.getCollege("cno", ID);
        if (!list.isEmpty()) {
            jsonObject.put("message", "院系编号已存在!");
            pw.print(jsonObject);
            pw.flush();
            return;
        }
        list.clear();
        list = CollegeDao.getCollege("name", name);
        if (!list.isEmpty()) {
            jsonObject.put("message", "院系名称已存在!");
            pw.print(jsonObject);
            pw.flush();
            return;
        }

        CollegeDao.addCollege(new College(ID, name));

        jsonObject.put("success", true);
        jsonObject.put("message", "操作成功!");
        pw.print(jsonObject);
        pw.flush();

    }

    private void getAllDept(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("departmentList", CollegeDao.getCollege("all"));
        req.getRequestDispatcher("/jsp/admin/department.jsp").forward(req, resp);
    }
}
