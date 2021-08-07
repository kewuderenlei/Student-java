package com.dao;

import com.bean.UserStu;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserStuDao {
    //查询
    public static List<UserStu> getUser(String flag, Object... value) {
        String sql = "";
        switch (flag) {
            case "uid":
                sql = "select * from user_stu where uid = ?";
                break;
            case "checkLogin":
                sql = "select * from user_stu where name = ? and pwd = ? and type = ?";
                break;
            case "all":
                sql = "select * from user_stu";
                break;
            default:
                break;
        }
        ResultSet rs = DBUtil.query(sql, value);
        List<UserStu> list = new ArrayList<>();
        try {
            while (rs.next()) {
                UserStu user = new UserStu();
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setUid(rs.getString("uid"));
                user.setName(rs.getString("name"));
                user.setClaName(rs.getString("cla_name"));
                user.setCollName(rs.getString("coll_name"));
                user.setSex(rs.getString("sex"));
                user.setHead(rs.getString("head"));
                user.setPwd(rs.getString("pwd"));
                user.setType(rs.getString("type"));
                user.setAge(rs.getString("age"));
                user.setAddress(rs.getString("address"));
                user.setCredit(rs.getString("credit"));
                user.setAttr1(rs.getString("attr1"));
                list.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }
        return list;
    }
}
