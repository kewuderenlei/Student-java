package com.dao;

import com.bean.Position;
import com.bean.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionDao {
    //查询
    public static List<Position> getPosition(String flag, Object... value) {
        ResultSet rs = null;
        String sql = "";
        switch (flag) {
            case "all":
                sql = "select * from position";
                break;
            default:
                break;
        }
        rs = DBUtil.query(sql, value);
        List<Position> list = new ArrayList<>();
        try {
            while (rs.next()) {
                Position position = new Position();
                position.setId(Integer.parseInt(rs.getString("id")));
                position.setpId(rs.getString("p_id"));
                position.setpName(rs.getString("p_name"));
                list.add(position);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

}
