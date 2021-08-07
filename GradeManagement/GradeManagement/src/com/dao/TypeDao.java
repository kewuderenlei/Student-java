package com.dao;

import com.bean.Type;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeDao {
    //查询
    public static List<Type> getType() {
        ResultSet rs = null;
        String sql = "select * from type";
        rs = DBUtil.query(sql);
        List<Type> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Type type = new Type();
                type.setId(Integer.parseInt(rs.getString("id")));
                type.settId(rs.getString("t_id"));
                type.settName(rs.getString("t_name"));
                type.setAttr1(rs.getString("attr1"));
                type.setAttr2(rs.getString("attr2"));
                list.add(type);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }
}
