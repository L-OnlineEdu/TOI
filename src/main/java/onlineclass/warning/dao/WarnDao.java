package onlineclass.warning.dao;

import core.dao.Dao;
import onlineclass.warning.mapper.WarnMapper;
import onlineclass.warning.model.Warn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WarnDao implements Dao {
    @Autowired
    WarnMapper warnMapper;

    @Override
    public List selectAll() {
        return warnMapper.selectAll();
    }

    @Override
    public Object select(Class c, int id) {
        return warnMapper.selectByPrimaryKey(id);
    }

    @Override
    public void add(Object object) {
        warnMapper.insert((Warn) object);
    }

    @Override
    public void del(Object x) {
        warnMapper.delete((Warn) x);
    }
}
