package com.example.springghh.service;

import com.example.springghh.spring.BeanPostProfessor;
import com.example.springghh.spring.Component;
import com.example.springghh.spring.GhhValue;

import java.lang.reflect.Field;

/**
 * @author kewuderenlei
 * @date 2021/12/3 0:47
 */
@Component
public class GhhValueBeanPostProfessor implements BeanPostProfessor {
    @Override
    public Object postProfessorBeforeInitialization(Object bean, String beanName) {

        for (Field field : bean.getClass().getDeclaredFields()) {
            //判断有没有GhhValue注解
            if(field.isAnnotationPresent(GhhValue.class)){
                field.setAccessible(true);
                String value = field.getAnnotation(GhhValue.class).value();
                try {
                    field.set(bean, value);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
        return bean;
    }
}
