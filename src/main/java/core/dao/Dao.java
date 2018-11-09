package core.dao;

import onlineclass.warning.model.Warn;

import java.util.List;

public interface Dao {


    List selectAll(String sql);

    Object select(Class c, int paperid);

    void add(Object object);

    void del(Warn x);
}
