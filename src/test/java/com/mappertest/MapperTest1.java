package com.mappertest;

import core.mapper.UserMapper;
import core.model.User;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import tk.mybatis.mapper.entity.Example;

public class MapperTest1 {
    private ClassPathXmlApplicationContext context;

    @Test
    public void test1() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
      /*  UserMapper userMapper = context.getBean(UserMapper.class);
        //获取全部信息
        List<User> users =userMapper.selectAll();
        Assert.assertNotNull(users);
        System.out.println(users);*/

        // Assert.assertEquals(183, countries.size());
      /*  WarnMapper warnMapper = context.getBean(WarnMapper.class);
        //获取全部信息
        List list = warnMapper.selectAll();
        Assert.assertNotNull(list);
        System.out.println(list);
        GroupMapper groupMapper = context.getBean(GroupMapper.class);
        //获取全部信息
        List list1 = groupMapper.selectAll();
        Assert.assertNotNull(list1);
        System.out.println(list1);*/
        UserMapper userMapper = context.getBean(UserMapper.class);
     /*  User user=new User();
        user.setUserName("stu1");*/
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userName", "stu1");
        User vu = userMapper.selectOneByExample(example);
        //User vu=userMapper.selectOneByExample(user);
        Assert.assertNotNull(vu);
    }
}
