package com.example.springghh.service;

import com.example.springghh.spring.Component;
import com.example.springghh.spring.Scope;

/**
 * @author kewuderenlei
 * @date 2021/12/2 14:30
 */
@Component
@Scope("prototype")
public class OrderService {

    public void test(){
        System.out.println("OrderService");
    }
}
