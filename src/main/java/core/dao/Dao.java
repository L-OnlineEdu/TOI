package core.dao;

import java.util.List;

public interface Dao {


    List selectAll(String sql);

    Object select(Class c, int id);

    void add(Object object);

    void del(Object x);
}
