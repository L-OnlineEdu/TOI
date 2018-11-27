package onlineclass.home.dao;

import onlineclass.home.mapper.ScoreMapper;
import onlineclass.home.model.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ScoreDaoImp implements ScoreDao {

    @Autowired
    ScoreMapper scoreMapper;

    @Override
    public List selectAll(String sql) {

        return scoreMapper.selectAll();
    }

    @Override
    public Object select(Class c, int id) {
        return scoreMapper.selectByPrimaryKey(id);
    }

    @Override
    public void add(Object object) {
        scoreMapper.insert((Score) object);
    }

    @Override
    public void del(Object x) {
        scoreMapper.delete((Score) x);
    }

    @Override
    public List<Score> findUserAllScore(int uid) {
        return scoreMapper.findUserAllScore(uid);
    }

    @Override
    public Score finduserLastScore(int uid) {
        return scoreMapper.finduserLastScore(uid);
    }
}
