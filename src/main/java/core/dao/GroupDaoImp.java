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
    public List selectAll(String sql) {
        return groupMapper.selectAllGroups();
    }

    @Override
    public Object select(Class c, int id) {
        return groupMapper.selectOneGroup(id);
    }

    @Override
    public void add(Object object) {
        groupMapper.insert((Group) object);
    }

    @Override
    public void del(Object x) {
        groupMapper.delete((Group) x);
    }

    @Override
    public List<Group> selectAllGroups() {
        return groupMapper.selectAllGroups();
    }

    @Override
    public Group selectOnGroup(int gid) {
        return groupMapper.selectOneGroup(gid);
    }

    @Override
    public List<User> selectUserInOneGroup(int gid) {
        List<User> users = groupMapper.selectOneGroup(gid).getUsers();
        return users;
    }

    @Override
    public List<Group> selectUserGroups(int uid) {
        return groupMapper.selectUserGroups(uid);
    }
}
