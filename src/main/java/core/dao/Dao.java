package core.dao;

import java.util.List;

public interface Dao {


    List selectAll();

    Object select(Class c, int id);

    void add(Object object);

    void del(Object x);
}
