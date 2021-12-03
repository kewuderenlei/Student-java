package com.example.springghh;

import com.example.springghh.service.UserInterface;
import com.example.springghh.spring.KeWuApplicationContext;

/**
 * @author kewuderenlei
 * @date 2021/12/2 15:11
 */
public class Test {
    public static void main(String[] args) {
        KeWuApplicationContext applicationContext = new KeWuApplicationContext(AppConfig.class);
        UserInterface userService = (UserInterface) applicationContext.getBean("userService");
        userService.test();
    }
}
