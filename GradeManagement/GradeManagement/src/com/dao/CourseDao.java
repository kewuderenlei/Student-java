package com.dao;

import com.bean.Course;
import com.bean.StuCourse;
import com.bean.TeaCourse;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDao {
    public static List queryStuCourse(Object... value){
        ResultSet rs = null;
        String sql = "select * from sc_view where s_no = ?";

        rs = DBUtil.query(sql, value);
        List<Course> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Course course = new Course();
                course.setcName(rs.getString("c_name"));
                course.setcTeacher(rs.getString("tea_name"));
                course.setcTerm(rs.getString("c_term"));
                course.setcHours(rs.getString("c_hours"));
                course.setcType(rs.getString("c_type"));
                course.setcCredit(rs.getString("c_credit"));
                course.setcStatus(rs.getString("c_status"));
                list.add(course);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

    public static List<TeaCourse> queryTeaCourse(String flag, Object... value){
        ResultSet rs = null;

        String sql = "";

        switch (flag){
            case "all":
                sql = "select * from tc_view";
                break;
            case "tea_id":
                sql = "select * from tc_view where tea_id = ?";
            default:
                break;
        }

        rs = DBUtil.query(sql, value);
        List<TeaCourse> list = new ArrayList<>();
        try {
            while (rs.next()) {
                TeaCourse course = new TeaCourse();
                course.settName(rs.getString("tea_name"));
                course.settId(rs.getString("tea_id"));
                course.setcName(rs.getString("c_name"));
                course.setcTerm(rs.getString("c_term"));
                course.setcHours(rs.getString("c_hours"));
                course.setcType(rs.getString("c_type"));
                course.setcCredit(rs.getString("c_credit"));
                course.setcNo(rs.getString("c_no"));
                list.add(course);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

    //查询
    public static List<Course> getCourse(String flag, Object... value) {
        ResultSet rs = null;
        String sql = "";
        switch (flag){
            case "all":
                sql = "select * from course";
                break;
            case "c_no":
                sql = "select * from course where c_no = ?";
                break;
            default:
                break;
        }
        rs = DBUtil.query(sql, value);
        List<Course> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Course course = new Course();
                course.setId(Integer.parseInt(rs.getString("id")));
                course.setcNo(rs.getString("c_no"));
                course.setcName(rs.getString("c_name"));
                course.setcTeacher(rs.getString("c_teacher"));
                String teaName = UserTeaDao.getUser("tid", rs.getString("c_teacher")).get(0).getTeaName();
                course.setcTeaName(teaName);
                course.setcTerm(rs.getString("c_term"));
                course.setcHours(rs.getString("c_hours"));
                course.setcType(rs.getString("c_type"));
                course.setcCredit(rs.getString("c_credit"));
                list.add(course);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

    //添加
    public static boolean addCourse(String cNo, String cName, String cTea, String cTerm, String cHours, String cType, String cCredit){
        cTea = UserDao.getUser("name", cTea).get(0).getAccId();
        String sql = "insert into course(c_no, c_name, c_teacher, c_term, c_hours, c_type, c_credit) values(?,?,?,?,?,?,?)";
        return DBUtil.update(sql, cNo, cName, cTea, cTerm, cHours, cType, cCredit);
    }

    //查询
    public static List<StuCourse> getStuCourse(String flag, Object... value) {
        ResultSet rs = null;
        String sql = "";
        switch (flag){
            case "all":
                sql = "select * from sc";
                break;
            case "sno":
                sql = "select * from sc where s_no = ?";
            default:
                break;
        }
        rs = DBUtil.query(sql, value);
        List<StuCourse> list = new ArrayList<>();
        try {
            while (rs.next()) {
                StuCourse course = new StuCourse();
                course.setId(Integer.parseInt(rs.getString("id")));
                course.setcNo(rs.getString("c_no"));
                course.setsNo(rs.getString("s_no"));
                course.setcStatus(rs.getString("c_status"));
                list.add(course);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

    //删除
    public static boolean deleteSc(Object... value) {
        String sql = "delete from sc where s_no = ? and c_no = ?";
        return DBUtil.update(sql, value);
    }

    //增加
    public static boolean addSc(Object... value) {
        String sql = "insert into sc(s_no, c_no) values (?, ?)";
        return DBUtil.update(sql, value);
    }
}
