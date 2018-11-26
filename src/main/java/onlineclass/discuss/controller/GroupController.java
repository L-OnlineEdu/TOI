package onlineclass.discuss.controller;


import com.alibaba.fastjson.JSON;
import core.dao.Dao;
import core.model.User;
import core.utils.Utils;
import onlineclass.discuss.model.Group;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Scope("prototype")
public class GroupController {
    private Dao dao;

    /*加载小组内成员 */

    @RequestMapping("loadGroupMem")
    public Map loadGroupMember(int groupId) {
        User u = Utils.getUser();
        String msg;
        List groupMembers;
        Map map = new HashMap();
        if (u != null) {

            if (groupId != 0) {

                Group g = (Group) dao.select(Group.class, groupId);
                groupMembers = g.getUsers();
            } else {
                groupMembers = dao.selectAll();
            }
            map.put("groupMembers", groupMembers);
            msg = "success";
        } else {
            msg = "error";
        }

        map.put("msg", msg);

        return map;
    }
    /*加载用户的小组*/ /*教师加载全部小组*/

    @RequestMapping("loadAllGroup")
    public String loadGroups() {
        User u = Utils.getUser();
        Map map = new HashMap();
        List groupList;
        String msg;
        if (u != null) {
            if (u.getRole().equals("tea")) {
                groupList = dao.selectAll();
            } else
                groupList = u.getGroups();
            map.put("groupList", groupList);
            msg = "success";
        } else {
            msg = "error";
        }


        map.put("msg", msg);
        return JSON.toJSONString(map);
    }

}
