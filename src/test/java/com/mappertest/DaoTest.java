package com.mappertest;

import assessment.assess.dao.CommentDao;
import core.dao.GroupDao;
import core.dao.UserDao;
import core.dao.UserDaoImp;
import core.model.User;
import onlineclass.discuss.model.Group;
import onlineclass.warning.dao.WarnDao;
import onlineclass.warning.model.Warn;
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

    @Test
    public void testAddWarn() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        WarnDao dao = context.getBean(WarnDao.class);
        Warn warn = new Warn();
        warn.setPointsOff(1);
        User user = new User();
        user.setUid(1);
        warn.setStudent(user);
        user.setUid(3);
        warn.setTeacher(user);
        dao.add(warn);
    }

    @Test
    public void testGroupDao() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        GroupDao groupDao = context.getBean(GroupDao.class);
        Group group = groupDao.selectOnGroup(1);
        // List usss=groupDao.selectUserInOneGroup(1);
        System.out.println(group);
        Assert.assertNotNull(group);
      /*  Group group= (Group) groupDao.select(Group.class,1);
        System.out.println(group);
        Assert.assertNotNull(group);*/
    }

    @Test
    public void testComment() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        CommentDao Dao = context.getBean(CommentDao.class);
        User c = Dao.selectRusers(1).get(0).getUser();
        System.out.println(c.getUserName());
        Assert.assertNotNull(c);
    }

}
