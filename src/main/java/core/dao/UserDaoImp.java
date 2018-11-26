package core.dao;

import core.mapper.UserMapper;
import core.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Repository
public class UserDaoImp implements UserDao {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User selectByUName(String userName) {
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userName", userName);

        return userMapper.selectOneByExample(example);
    }

    @Override
    public List selectAllStu() {
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("role", "stu");
        return userMapper.selectByExample(example);
    }

    @Override
    public List selectAllTea() {
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("role", "tea");
        return userMapper.selectByExample(example);
    }

    @Override
    public List selectAll() {


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
