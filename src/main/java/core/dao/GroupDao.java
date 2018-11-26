package core.dao;

import core.model.User;
import onlineclass.discuss.model.Group;

import java.util.List;

public interface GroupDao extends Dao {
    List<Group> selectAllGroups();

    Group selectOnGroup(int gid);

    List<User> selectUserInOneGroup(int gid);

    List<Group> selectUserGroups(int uid);
}
