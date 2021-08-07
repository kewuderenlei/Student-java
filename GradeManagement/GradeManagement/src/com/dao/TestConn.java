package com.dao;

import com.bean.User;

import java.util.List;

public class TestConn {
    public static void main(String[] args) {

        List<User> list = UserDao.getUser("checkLogin", "test1", "123456", "学生");
        if (list != null && !list.isEmpty()) {
            for (User type : list) {
                System.out.println(type);
            }
        }
//        boolean rs = UserDao.addUser(user);
//        if(rs){
//            System.out.println("update success");
//        }
    }
}
