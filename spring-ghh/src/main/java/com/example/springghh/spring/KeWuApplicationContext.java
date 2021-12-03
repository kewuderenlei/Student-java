package com.example.springghh.spring;

import java.beans.Introspector;
import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author kewuderenlei
 * @date 2021/12/2 14:32
 */
public class KeWuApplicationContext {
    private Class configClass;
    private Map<String, BeanDefinition> beanDefinitionMap = new HashMap<>();
    private Map<String, Object> singletonObjects = new HashMap<>();
    private List<BeanPostProfessor> beanPostProfessorList = new ArrayList<>();


    public KeWuApplicationContext(Class configClass) {
        this.configClass = configClass;
        //获取扫描路径
        scan(configClass);

        for (Map.Entry<String, BeanDefinition> entry : beanDefinitionMap.entrySet()) {
            String beanName = entry.getKey();
            BeanDefinition beanDefinition = entry.getValue();
            if("singleton".equals(beanDefinition.getScope())){
                Object bean = createBean(beanName, beanDefinition);
                singletonObjects.put(beanName, bean);
            }
        }
    }

    private Object createBean(String beanName, BeanDefinition beanDefinition){
        Class clazz = beanDefinition.getType();
        Object instance = null;
        try {
            instance = clazz.getConstructor().newInstance();
            //依赖注入
            //遍历所有属性，判断那个属性有Autowired注解
            for (Field field : clazz.getDeclaredFields()) {
                if(field.isAnnotationPresent(Autowired.class)){
                    //允许通过反射来获取字段的值，设置访问权限为true，就能访问私有属性
                    field.setAccessible(true);
                    field.set(instance, getBean(field.getName()));
                }
            }

            //Aware
            //判断有没有实现BeanNameAware接口
            if (instance instanceof BeanNameAware) {
                ((BeanNameAware)instance).setBeanName(beanName);
            }

            //初始化前
            for (BeanPostProfessor beanPostProfessor : beanPostProfessorList) {
                instance = beanPostProfessor.postProfessorBeforeInitialization(instance, beanName);
            }

            //初始化
            //判断当前实例对象是否实现了InitializationBean接口
            if(instance instanceof InitializationBean){
                //调用afterPropertiesSet方法进行初始化
                ((InitializationBean)instance).afterPropertiesSet();

            }

            //初始化后
            //for (BeanPostProfessor beanPostProfessor : beanPostProfessorList) {
            //    //这是一个代理对象
            //    instance = beanPostProfessor.postProfessorAfterInitialization(instance, beanName);
            //}

        } catch (InstantiationException | InvocationTargetException |
                NoSuchMethodException | IllegalAccessException e) {
            e.printStackTrace();
        }
        return instance;
    }

    public Object getBean(String beanName){
        //找有没有该bean，没有就抛个异常
        if(!beanDefinitionMap.containsKey(beanName)){
            throw new NullPointerException();
        }
        BeanDefinition beanDefinition = beanDefinitionMap.get(beanName);
        if("singleton".equals(beanDefinition.getScope())){
            Object singletonBean = singletonObjects.get(beanName);
            //如果没有该bean，创建并放入单例池
            if(singletonBean == null){
                singletonBean = createBean(beanName, beanDefinition);
                singletonObjects.put(beanName, singletonBean);
            }
            return singletonBean;
        }else{
            //多例
            Object prototypeBean = createBean(beanName, beanDefinition);
            return prototypeBean;
        }

    }


    private void scan(Class configClass) {
        if(configClass.isAnnotationPresent(ComponentScan.class)){
            ComponentScan componentScan = (ComponentScan) configClass.getAnnotation(ComponentScan.class);
            String path = componentScan.value();
            path = path.replace(".", "/");
            //获取app类加载器
            ClassLoader classLoader = KeWuApplicationContext.class.getClassLoader();
            //获取到对应url
            URL resource = classLoader.getResource(path);
            File file = new File(resource.getFile());
            if(file.isDirectory()){
                for (File f : file.listFiles()) {
                    String absolutePath = f.getAbsolutePath();

                    absolutePath = absolutePath.substring(absolutePath.indexOf("com"), absolutePath.indexOf(".class"));
                    absolutePath = absolutePath.replace("\\", ".");
                    try {
                        Class<?> clazz = classLoader.loadClass(absolutePath);
                        if(clazz.isAnnotationPresent(Component.class)){
                            //判断是否实现了BeanPostProfessor
                            if (BeanPostProfessor.class.isAssignableFrom(clazz)) {
                                BeanPostProfessor instance = (BeanPostProfessor) clazz.getConstructor().newInstance();
                                beanPostProfessorList.add(instance);
                            }else {
                                //获取注解中定义的bean的名字
                                String beanName = clazz.getAnnotation(Component.class).value();
                                if ("".equals(beanName)) {
                                    beanName = Introspector.decapitalize(clazz.getSimpleName());
                                }
                                //如果是bean，创建beanDefinition
                                BeanDefinition beanDefinition = new BeanDefinition();
                                //设置type
                                beanDefinition.setType(clazz);
                                if (clazz.isAnnotationPresent(Scope.class)) {
                                    Scope scope = clazz.getAnnotation(Scope.class);
                                    String value = scope.value();
                                    beanDefinition.setScope(value);
                                } else {
                                    //没有scope默认单例
                                    beanDefinition.setScope("singleton");
                                }
                                //把beanDefinition存入Map中，key为beanName
                                beanDefinitionMap.put(beanName, beanDefinition);
                            }
                        }
                    } catch (ClassNotFoundException | NoSuchMethodException |
                            InstantiationException | InvocationTargetException
                            | IllegalAccessException e) {
                        e.printStackTrace();
                    }

                }
            }
        }
    }
}
