package com.mappertest;

import assessment.assess.dao.CommentDao;
import assessment.assess.dao.CommentDaoImp;
import assessment.assess.model.Comment;
import core.dao.UserDao;
import core.dao.UserDaoImp;
import core.model.User;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

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

    @Test
    public void test2() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        CommentDao comDao = context.getBean(CommentDaoImp.class);
        List<Comment> c = comDao.selectByTypeAndRuid(1, 6);
        System.out.println(c);
        Assert.assertNotNull(c);
    }
}
