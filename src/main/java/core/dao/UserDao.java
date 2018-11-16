package core.dao;

import core.model.User;

public interface UserDao extends Dao {
    User selectByUName(String userName);

}
