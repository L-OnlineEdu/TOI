package com.mappertest;

import onlineclass.discuss.mapper.GroupMapper;
import onlineclass.warning.mapper.WarnMapper;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

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
        WarnMapper warnMapper = context.getBean(WarnMapper.class);
        //获取全部信息
        List list = warnMapper.selectAll();
        Assert.assertNotNull(list);
        System.out.println(list);
        GroupMapper groupMapper = context.getBean(GroupMapper.class);
        //获取全部信息
        List list1 = groupMapper.selectAll();
        Assert.assertNotNull(list1);
        System.out.println(list1);
    }
}
