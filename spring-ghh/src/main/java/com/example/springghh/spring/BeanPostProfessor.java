package com.example.springghh.spring;

/**
 * @author kewuderenlei
 * @date 2021/12/3 0:43
 */
public interface BeanPostProfessor {

    default Object postProfessorBeforeInitialization(Object bean, String beanName){
        return bean;
    }

    default Object postProfessorAfterInitialization(Object bean, String beanName){
        return bean;
    }
}
