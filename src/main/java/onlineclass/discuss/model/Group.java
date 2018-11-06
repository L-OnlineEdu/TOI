package onlineclass.discuss.model;


import core.model.User;

import java.util.List;

public class Group {

    private int gid;
    private String gname;

    private transient List<User> users;


    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }


    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
