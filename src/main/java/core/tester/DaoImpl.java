package core.tester;

import core.dao.Dao;
import core.model.User;
import onlineclass.warning.model.Warn;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class DaoImpl implements Dao {
    @Override
    public List selectAll(String sql) {
        List list = new ArrayList();
        User tester = new User();
        tester.setUid(1);
        tester.setUserName("test");
        tester.setPassWord("123");
        tester.setRole("tea");

        list.add(tester);
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
    public void del(Warn x) {

    }
}
