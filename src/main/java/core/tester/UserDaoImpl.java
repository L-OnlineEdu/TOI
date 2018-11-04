package core.tester;

import core.dao.UserDao;
import core.model.User;

public class UserDaoImpl implements UserDao {
    @Override
    public User selectByUName(String userName) {
        User tester = new User();
        tester.setUid(1);
        tester.setUserName("test");
        tester.setPassWord("123");
        tester.setRole("tea");

        return tester;
    }
}
