package com.dao;

import com.bean.Class;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassDao {
    //查询
    public static List<Class> getClass(String flag, Object... value) {
        ResultSet rs = null;
        String sql = "";
        switch (flag){
            case "all":
                sql = "select * from class";
                break;
            case "cno":
                sql = "select * from class where cla_id = ?";
                break;
            case "id":
                sql = "select * from class where id = ?";
                break;
            case "cname":
                sql = "select * from class where cla_name = ?";
                break;
            default:
                break;
        }
        rs = DBUtil.query(sql, value);
        List<Class> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Class aClass = new Class();
                aClass.setId(Integer.parseInt(rs.getString("id")));
                aClass.setClaId(rs.getString("cla_id"));
                aClass.setClaName(rs.getString("cla_name"));
                aClass.setAttr1(rs.getString("attr1"));
                aClass.setAttr2(rs.getString("attr2"));
                aClass.setAttr3(rs.getString("attr3"));
                list.add(aClass);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return list;
    }

    //添加
    public static boolean addClass(String cno, String cname){
        String sql = "insert into class(cla_id, cla_name) values(?,?)";
        return DBUtil.update(sql, cno, cname);
    }

    //删除
    public static boolean deleteClass(Object... value) {
        String sql = "delete from class where id = ?";
        return DBUtil.update(sql, value);
    }

    //修改
    public static boolean updateClass(Object... value) {
        String sql = "update class set cla_id = ?, cla_name = ? where id = ?";
        return DBUtil.update(sql, value);
    }
}
