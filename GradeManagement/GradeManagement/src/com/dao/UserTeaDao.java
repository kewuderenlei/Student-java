package com.dao;

import com.bean.UserTea;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserTeaDao {
    //查询
    public static List<UserTea> getUser(String flag, Object... value) {
        String sql = "";
        switch (flag) {
            case "tid":
                sql = "select * from user_tea where tea_id = ?";
                break;
            case "checkLogin":
                sql = "select * from user_tea where tea_name = ? and pwd = ? and type = ?";
                break;
            case "all":
                sql = "select * from user_tea";
                break;
            default:
                break;
        }
        ResultSet rs = DBUtil.query(sql, value);
        List<UserTea> list = new ArrayList<>();
        try {
            while (rs.next()) {
                UserTea user = new UserTea();
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setTeaId(rs.getString("tea_id"));
                user.setTeaName(rs.getString("tea_name"));
                user.setTeaSex(rs.getString("tea_sex"));
                user.setTeaAge(rs.getString("tea_age"));
                user.setTeaSet(rs.getString("tea_set"));
                user.setTeaPhone(rs.getString("tea_phone"));
                user.setType(rs.getString("type"));
                user.setHead(rs.getString("head"));
                user.setPwd(rs.getString("pwd"));
                user.setAttr1(rs.getString("attr1"));
                user.setAttr2(rs.getString("attr2"));
                user.setAttr3(rs.getString("attr3"));
                user.setAttr4(rs.getString("attr4"));
                user.setAttr5(rs.getString("attr5"));
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
