package com.tester;

import core.dao.Dao;
import core.model.User;

import java.util.ArrayList;
import java.util.List;


public class DaoMock implements Dao {
    @Override
    public List selectAll(String sql) {
        List list = new ArrayList();
        User tester = new User();
        tester.setUid(1);
        tester.setUserName("test");
        tester.setPassWord("123");
        tester.setRole("tea");


        list.add(tester);
        User tester1 = new User();
        tester1.setUid(2);
        tester1.setUserName("test");
        tester1.setPassWord("123");
        tester1.setRole("tea");


        list.add(tester1);
        return list;
    }

    @Override
    public Object select(Class c, int paperid) {
        return null;
    }

    @Override
    public void add(Object object) {

    }

    @Override
    public void del(Object x) {

    }


}
