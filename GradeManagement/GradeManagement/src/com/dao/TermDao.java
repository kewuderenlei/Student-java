package com.dao;

import com.bean.Course;
import com.bean.Term;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TermDao {
    public static List<Term> queryAllTerm(){
        ResultSet rs = null;
        String sql = "select * from term";

        rs = DBUtil.query(sql);
        List<Term> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.settName(rs.getString("t_name"));
                term.settNo(rs.getString("t_no"));
                list.add(term);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

    public static List<Term> getTerm(String flag, Object... value){
        ResultSet rs = null;
        String sql = "";
        switch (flag){
            case "all":
                sql = "select * from term";
                break;
            case "t_name":
                sql = "select * from term where t_name = ?";
                break;
            default:
                break;
        }

        rs = DBUtil.query(sql, value);
        List<Term> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.settName(rs.getString("t_name"));
                term.settNo(rs.getString("t_no"));
                list.add(term);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }
}
