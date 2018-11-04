package core.dao;

import core.model.User;

public interface UserDao {
    User selectByUName(String userName);

}
