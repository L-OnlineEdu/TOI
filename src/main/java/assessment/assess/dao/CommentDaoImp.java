package assessment.assess.dao;

import assessment.assess.mapper.CommentMapper;
import assessment.assess.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Repository
public class CommentDaoImp implements CommentDao {
    @Autowired
    private CommentMapper comMapper;

    @Override
    public Object select(Class c, int id) {
        return comMapper.selectByPrimaryKey(id);
    }

    @Override
    public void add(Object object) {
        comMapper.insert((Comment) object);
    }

    @Override
    public void del(Object x) {
        comMapper.delete((Comment) x);
    }


    public List<Comment> selectByTypeAndRuid(int type, int id) {
        Example example = new Example(Comment.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("type", type).andEqualTo("ruid", id);
        return comMapper.selectByExample(example);
    }

    @Override
    public List selectAll() {
        return comMapper.selectAll();
    }

}
