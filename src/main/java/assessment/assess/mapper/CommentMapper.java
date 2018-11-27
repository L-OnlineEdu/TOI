package assessment.assess.mapper;

import assessment.assess.model.Comment;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CommentMapper extends Mapper<Comment> {
    List<Comment> selectRusers(int cid);
}
