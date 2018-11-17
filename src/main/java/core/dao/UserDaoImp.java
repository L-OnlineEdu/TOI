package core.dao;

import core.mapper.UserMapper;
import core.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImp implements UserDao {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User selectByUName(String userName) {
        User user = new User();
        user.setUserName(userName);
        return userMapper.selectOne(user);
    }

    @Override
    public List selectAll(String sql) {
        return userMapper.selectAll();
    }

    @Override
    public Object select(Class c, int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public void add(Object object) {
        userMapper.insert((User) object);
    }

    @Override
    public void del(Object x) {
        userMapper.delete((User) x);
    }


}
