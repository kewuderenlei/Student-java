package com.example.springghh.service;

import com.example.springghh.spring.BeanPostProfessor;
import com.example.springghh.spring.Component;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * @author kewuderenlei
 * @date 2021/12/3 0:47
 */
@Component
public class GhhBeanPostProfessor implements BeanPostProfessor {
    @Override
    public Object postProfessorAfterInitialization(Object bean, String beanName) {

        if("userService".equals(beanName)) {
            Object proxyInstance = Proxy.newProxyInstance(GhhBeanPostProfessor.class.getClassLoader(),
                    bean.getClass().getInterfaces(), new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                            System.out.println("切面方法");
                            return method.invoke(bean, args);
                        }
                    });
            return proxyInstance;
        }
        return bean;
    }
}
