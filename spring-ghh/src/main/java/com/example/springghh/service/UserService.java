package com.example.springghh.service;

import com.example.springghh.spring.Autowired;
import com.example.springghh.spring.BeanNameAware;
import com.example.springghh.spring.Component;
import com.example.springghh.spring.GhhValue;

/**
 * @author kewuderenlei
 * @date 2021/12/2 14:30
 */
@Component("userService")
public class UserService implements UserInterface, BeanNameAware {

    @Autowired
    private OrderService orderService;

    @GhhValue("ghh")
    private String test;

    private String beanName;

    @Override
    public void test(){
        System.out.println("beanName:"+beanName);
    }


    @Override
    public void setBeanName(String name) {
        this.beanName = name;
    }
}
