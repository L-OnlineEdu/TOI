package core.dao;

import core.model.User;

import java.util.List;

public interface UserDao extends Dao {
    User selectByUName(String userName);

    List selectAllStu();

    List selectAllTea();

}
