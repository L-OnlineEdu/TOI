package core.dao;

import core.model.User;

import java.util.List;

public interface GroupDao extends Dao {
    List<User> selectAllGroupUsers(int gid);
}
