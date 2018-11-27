package onlineclass.discuss.model;


import core.model.User;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.annotation.KeySql;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.List;

@Component
@NameStyle(Style.normal)
@Table(name = "groups")
public class Group {
    @Id
    @KeySql(useGeneratedKeys = true)
    private int gid;
    private String gname;

    private List<User> users;


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

    @Override
    public String toString() {
        return "Group{" +
                "gid=" + gid +
                ", gname='" + gname + '\'' +
                ", users=" + users +
                '}';
    }
}
