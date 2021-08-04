package com.dao;

import com.bean.User;
import com.bean.UserAdmin;
import com.bean.UserStu;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    //添加用户
    public static boolean addUser(String uid, String name, String claName, String collName, String sex, String pwd, String type, String age, String address) {
        boolean rs = false;
        String sql = "insert into user(acc_id, username, pwd, type) values(?,?,?,?)";
        String credit = "0";
        if (pwd.equals("")) {
            pwd = "123456";
        }
        rs = DBUtil.update(sql, uid, name, pwd, type);
        //1 学生  0 教师
        if (type.equals("1")) {
            sql = "insert into user_stu(uid, name, cla_name, coll_name, sex, pwd, type, age, address, credit) values(?,?,?,?,?,?,?,?,?,?)";
            type = "学生";
            rs = DBUtil.update(sql, uid, name, claName, collName, sex, pwd, type, age, address, credit);
            if (!rs) {
                return rs;
            }
        } else if (type.equals("0")){
            sql = "insert into user_tea(tea_id, tea_name, tea_sex, tea_age, tea_set, tea_phone, type, pwd) values(?,?,?,?,?,?,?,?)";
            type = "教师";
            rs = DBUtil.update(sql, uid, name, sex, age, claName, collName, type, pwd);
            if (!rs) {
                return rs;
            }
        }
        return rs;
    }

    //删除
    public static boolean deleteUser(List<Integer> list) {
        boolean rs = false;
        String sql = "delete from user where id = ?";
        if (list != null && !list.isEmpty()) {
            for (int i = 0; i < list.size(); i++) {
                rs = DBUtil.update(sql, list.get(i));
                if (!rs) {
                    break;
                }
            }
        }

        return rs;
    }

    //修改
    public static boolean updateUser(User user) {
        boolean rs = false;
        String sql = "update user set acc_id = ?, username = ?, pwd = ?, type = ? where id = ?";
        rs = DBUtil.update(sql, user.getAccId(), user.getUsername(), user.getPwd(), user.getType(), user.getId());
        return rs;
    }

    //查询
    public static List<User> getUser(String flag, Object... value) {
        ResultSet rs = null;
        String sql = "";
        switch (flag) {
            case "id":
                sql = "select * from user where id = ?";
                break;
            case "name":
                sql = "select * from user where username = ?";
                break;
            case "checkLogin":
                sql = "select * from user where username = ? and pwd = ? and type = (select t_id from type where t_name = ?)";
                break;
            default:
                break;
        }
        rs = DBUtil.query(sql, value);
        List<User> list = new ArrayList<>();
        try {
            while (rs.next()) {
                User user = new User();
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setUsername(rs.getString("username"));
                user.setPwd(rs.getString("pwd"));
                user.setType(rs.getString("type"));
                user.setAccId(rs.getString("acc_id"));
                user.setAttr1(rs.getString("attr1"));
                user.setAttr2(rs.getString("attr2"));
                user.setAttr3(rs.getString("attr3"));
                list.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return list;
    }

    public static List<UserAdmin> getAdmin(String flag, Object... value) {
        String sql = "";
        switch (flag) {
            case "admin":
                sql = "select * from user_admin where ad_no = ?";
                break;
            case "checkLogin":
                sql = "select * from user_admin where ad_no = ? and ad_name = ? and ad_pwd = ? ";
                break;
            default:
                break;
        }
        ResultSet rs = DBUtil.query(sql, value);
        List<UserAdmin> list = new ArrayList<>();
        try {
            while (rs.next()) {
                UserAdmin user = new UserAdmin();
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setAdNo(rs.getString("ad_no"));
                user.setAdName(rs.getString("ad_name"));
                user.setAdPwd(rs.getString("ad_pwd"));
                user.setAdSex(rs.getString("ad_sex"));
                user.setAdAge(rs.getString("ad_age"));
                user.setAdType(rs.getString("ad_type"));
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
