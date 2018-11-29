package assessment.assess.dao;

import assessment.assess.model.Comment;
import core.dao.Dao;

import java.util.List;

public interface CommentDao extends Dao {
    List<Comment> selectByTypeAndRuid(int type, int id);

    List<Comment> selectRusers(int cid);

    List<Comment> selectBypid(int pid);

    void update(Comment x);
}
