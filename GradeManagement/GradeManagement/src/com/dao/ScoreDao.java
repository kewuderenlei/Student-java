package com.dao;

import com.bean.StuScore;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ScoreDao {
    public static List<StuScore> queryStuScore(String flag, Object... value){
        ResultSet rs = null;
        String sql = "";
        switch (flag){
            case "s_no":
                sql = "select * from ss_view where s_no = ?";
                break;
            case "tea_id":
                sql = "select * from ss_view where tea_id = ?";
                break;
            case "all":
                sql = "select * from ss_view";
                break;
            case "s_term":
                sql = "select * from ss_view where t_name = ? and s_no = ?";
                break;
            case "c_name":
                sql = "select * from ss_view where c_name = ? and tea_id = ?";
                break;
            case "c_term":
                sql = "select * from ss_view where t_name = ? and tea_id = ?";
                break;
            case "c_tc":
                sql = "select * from ss_view where c_name = ? and t_name = ? and tea_id = ?";
                break;
            default:
                break;
        }

        rs = DBUtil.query(sql, value);
        List<StuScore> list = new ArrayList<>();
        try {
            while (rs.next()) {
                StuScore score = new StuScore();
                score.setsNo(rs.getString("s_no"));
                score.setsName(rs.getString("s_name"));
                score.settNo(rs.getString("t_no"));
                score.settName(rs.getString("t_name"));
                score.setcNo(rs.getString("c_no"));
                score.setcName(rs.getString("c_name"));
                score.setTeaId(rs.getString("tea_id"));
                score.setTeaName(rs.getString("tea_name"));
                score.setcHours(rs.getString("c_hours"));
                score.setcCredit(rs.getString("c_credit"));
                score.setcType(rs.getString("c_type"));
                score.setScore(rs.getString("score"));
                score.setClaName(rs.getString("cla_name"));
                list.add(score);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

    public static boolean updateScore(String[] score, String[] stuNo, String[] termNo, String[] courseNo, String[] teaId, String size){
        boolean rs = false;

        String sql = "update score set score = ? where s_no = ? and c_no = ? and term = ? and t_no = ?";
        for (int i = 0; i < Integer.parseInt(size); i++) {
            rs = DBUtil.update(sql, score[i], stuNo[i], courseNo[i], termNo[i], teaId[i]);
            if (!rs){
                break;
            }
        }

        return rs;
    }

    //添加
    public static boolean addScore(Object... value){
        String sql = "insert into score(s_no, c_no, term, score, t_no) values(?,?,?,?,?)";
        return DBUtil.update(sql, value);
    }

    //删除
    public static boolean deleteScore(Object... value){
        String sql = "delete from score where s_no = ? and c_no = ? and term = ? and score = ? and t_no = ?";
        return DBUtil.update(sql, value);
    }
}
