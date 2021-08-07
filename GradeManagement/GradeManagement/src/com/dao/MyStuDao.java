package com.dao;

import com.bean.MyStu;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyStuDao {
    public static List<MyStu> queryTeaStu(Object... value){
        ResultSet rs = null;
        String sql = "select * from mystu_view where tea_id = ?";

        rs = DBUtil.query(sql, value);
        List<MyStu> list = new ArrayList<>();
        try {
            while (rs.next()) {
                MyStu myStu = new MyStu();
                myStu.setName(rs.getString("name"));
                myStu.setUid(rs.getString("uid"));
                myStu.setcName(rs.getString("c_name"));
                myStu.setcTerm(rs.getString("c_term"));
                myStu.setTeaId(rs.getString("tea_id"));
                myStu.setTeaName(rs.getString("tea_name"));
                list.add(myStu);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

    public static List<MyStu> queryTeaStu1(String flag, Object... value){
        ResultSet rs = null;
        String sql = "";
        switch (flag){
            case "all":
                sql = "select * from mystu_view";
                break;
            case "tea_id":
                sql = "select * from mystu_view where tea_id = ?";
                break;
            case "c_name":
                sql = "select * from mystu_view where c_name = ? and tea_id = ?";
                break;
            case "c_term":
                sql = "select * from mystu_view where c_term = ? and tea_id = ?";
                break;
            case "c_tc":
                sql = "select * from mystu_view where c_name = ? and c_term = ? and tea_id = ?";
                break;
            default:
                break;
        }

        rs = DBUtil.query(sql, value);
        List<MyStu> list = new ArrayList<>();
        try {
            while (rs.next()) {
                MyStu myStu = new MyStu();
                myStu.setName(rs.getString("name"));
                myStu.setUid(rs.getString("uid"));
                myStu.setcName(rs.getString("c_name"));
                myStu.setcTerm(rs.getString("c_term"));
                myStu.setTeaId(rs.getString("tea_id"));
                myStu.setTeaName(rs.getString("tea_name"));
                list.add(myStu);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }
}
