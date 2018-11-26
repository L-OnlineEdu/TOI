package onlineclass.discuss.mapper;

import onlineclass.discuss.model.Group;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


public interface GroupMapper extends Mapper<Group> {
    Group selectOneGroup(int gid);

    List<Group> selectAllGroups();

    List<Group> selectUserGroups(int uid);
}
