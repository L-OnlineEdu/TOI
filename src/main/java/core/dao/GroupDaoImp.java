package core.dao;

import core.model.User;
import onlineclass.discuss.mapper.GroupMapper;
import onlineclass.discuss.model.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GroupDaoImp implements GroupDao {
    @Autowired
    GroupMapper groupMapper;

    @Override
    public List<User> selectAllGroupUsers(int gid) {
        return null;
    }

    @Override
    public List selectAll(String sql) {
        return groupMapper.selectAll();
    }

    @Override
    public Object select(Class c, int id) {
        return groupMapper.selectByPrimaryKey(id);
    }

    @Override
    public void add(Object object) {
        groupMapper.insert((Group) object);
    }

    @Override
    public void del(Object x) {
        groupMapper.delete((Group) x);
    }
}
