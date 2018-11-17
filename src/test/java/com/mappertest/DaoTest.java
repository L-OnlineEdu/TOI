package com.mappertest;

import core.dao.UserDao;
import core.dao.UserDaoImp;
import core.model.User;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DaoTest {
    private ClassPathXmlApplicationContext context;

    @Test
    public void test1() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserDao userDao = context.getBean(UserDaoImp.class);
        User u = userDao.selectByUName("stu1");
        System.out.println(u);
        Assert.assertNotNull(u);
    }
}
