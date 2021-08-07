package com.dao;

import java.sql.*;

public class DBUtil {
    private static String dbDriver = "com.mysql.jdbc.Driver";
    private static String connUrl = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=utf-8";
    private static Connection conn = null;
    private static String account = "root";
    private static String pwd = "123456";

    static {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //链接数据库
    public static Connection getconnection() {
        try {
            return DriverManager.getConnection(connUrl, account, pwd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean update(String sql) {
        Statement statement = null;
        try {
            conn = getconnection();
            statement = conn.createStatement();
            int result = statement.executeUpdate(sql);
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean update(String sql, Object... params) {
        PreparedStatement prepareStatement = null;
        try {
            conn = getconnection();
            prepareStatement = conn.prepareStatement(sql);

            for (int i = 1; i <= params.length; i++) {
                prepareStatement.setObject(i, params[i - 1]);
            }
            int result = prepareStatement.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return false;
    }

    public static ResultSet query(String sql, Object... params) {
        ResultSet rs = null;
        PreparedStatement prepareStatement = null;
        try {
            conn = getconnection();
            prepareStatement = conn.prepareStatement(sql);

            for (int i = 1; i <= params.length; i++) {
                prepareStatement.setObject(i, params[i - 1]);
            }
            rs = prepareStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    //关闭数据库
    public static void close() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                conn = null;
            }
        }
    }
}
