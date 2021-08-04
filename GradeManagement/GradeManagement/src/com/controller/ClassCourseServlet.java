package com.controller;

import com.bean.Course;
import com.bean.StuCourse;
import com.bean.StuScore;
import com.bean.UserStu;
import com.dao.ClassDao;
import com.dao.CourseDao;
import com.dao.ScoreDao;
import com.dao.TermDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ClassCourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");

        String method = req.getServletPath().substring(9);
        System.out.println(method);

        switch (method) {
            case "classCourse":
                classCourse(req, resp);
                break;
            case "chooseCourse":
                chooseCourse(req, resp);
                break;
            case "deleteCourse":
                deleteCourse(req, resp);
                break;
            default:
                break;
        }

    }

    private void deleteCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseId = req.getParameter("courseId");
        String teaId = req.getParameter("teaId");
        UserStu userStu = (UserStu) req.getSession().getAttribute("student");

        CourseDao.deleteSc(userStu.getUid(), courseId);

        String tName = CourseDao.getCourse("c_no", courseId).get(0).getcTerm();
        String tNo = TermDao.getTerm("t_name", tName).get(0).gettNo();
        ScoreDao.deleteScore(userStu.getUid(), courseId, tNo, "", teaId);
        classCourse(req, resp);
    }

    private void chooseCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseId = req.getParameter("courseId");
        String teaId = req.getParameter("teaId");

        UserStu userStu = (UserStu) req.getSession().getAttribute("student");
        CourseDao.addSc(userStu.getUid(), courseId);
        String tName = CourseDao.getCourse("c_no", courseId).get(0).getcTerm();
        String tNo = TermDao.getTerm("t_name", tName).get(0).gettNo();
        ScoreDao.addScore(userStu.getUid(), courseId, tNo, "", teaId);
        classCourse(req, resp);
    }

    private void classCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserStu userStu = (UserStu) req.getSession().getAttribute("student");
        List<Course> list = CourseDao.getCourse("all");
        List<StuCourse> list2 = CourseDao.getStuCourse("sno", userStu.getUid());

        for (Course course : list) {
            for (StuCourse stuCourse : list2) {
                if (stuCourse.getcNo().equals(course.getcNo())) {
                    course.setcStatus("已选");
                }
            }
        }
        req.setAttribute("courseList", list);

        req.getRequestDispatcher("/jsp/student/choose-courses.jsp").forward(req, resp);
    }
}
