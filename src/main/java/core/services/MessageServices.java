package core.services;

import core.dao.GroupDao;
import core.dao.UserDao;
import core.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MessageServices {


    @Autowired
    private GroupDao groupDao;

    @Autowired
    private UserDao userDao;

    public List getAllUserId() throws Exception {

        List users = userDao.selectAll();

        return getUserListIds(users);

    }

    public List getUserIdInGroup(int gid) throws Exception {
        List<Integer> userIds = new ArrayList();
        List<User> users = groupDao.selectUserInOneGroup(gid);
        List<User> teachers = userDao.selectAllTea();
        userIds = getUserListIds(users);
        userIds.addAll(getUserListIds(teachers));
        return userIds;

    }

    private List<Integer> getUserListIds(List<User> users) throws Exception {
        List userIds = new ArrayList();

        for (User user : users) {
            // if (user instanceof User) {
            int uid = user.getUid();
            userIds.add(uid);
           /* } else {
                throw new Exception("类型异常");
            }*/
        }
        return userIds;
    }
}
