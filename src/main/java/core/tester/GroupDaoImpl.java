package core.tester;

import core.dao.GroupDao;
import core.model.User;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class GroupDaoImpl extends DaoImpl implements GroupDao {


    @Override
    public List<User> selectAllGroupUsers(int gid) {
        return null;
    }
}
