package com.dao;

import com.bean.College;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CollegeDao {
    //查询
    public static List<College> getCollege(String flag, Object... value) {
        ResultSet rs = null;
        String sql = "";
        switch (flag){
            case "all":
                sql = "select * from college";
                break;
            case "cno":
                sql = "select * from college where coll_id = ?";
                break;
            case "id":
                sql = "select * from college where id = ?";
                break;
            case "name":
                sql = "select * from college where coll_name = ?";
                break;
            default:
                break;
        }
        rs = DBUtil.query(sql, value);
        List<College> list = new ArrayList<>();
        try {
            while (rs.next()) {
                College college = new College();
                college.setId(Integer.parseInt(rs.getString("id")));
                college.setCollId(rs.getString("coll_id"));
                college.setCollName(rs.getString("coll_name"));
                college.setAttr1(rs.getString("attr1"));
                college.setAttr2(rs.getString("attr2"));
                college.setAttr3(rs.getString("attr3"));
                list.add(college);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

    //添加
    public static boolean addCollege(College college){
        String sql = "insert into college(coll_id, coll_name) values(?,?)";
        boolean rs = DBUtil.update(sql, college.getCollId(), college.getCollName());
        return rs;
    }

    //删除
    public static boolean deleteCollege(Object... value) {
        String sql = "delete from college where id = ?";
        return DBUtil.update(sql, value);
    }

    //修改
    public static boolean updateCollege(Object... value) {
        String sql = "update college set coll_id = ?, coll_name = ? where id = ?";
        return DBUtil.update(sql, value);
    }
}
