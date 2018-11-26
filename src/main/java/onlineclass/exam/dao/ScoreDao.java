package onlineclass.exam.dao;

import core.dao.Dao;
import onlineclass.exam.model.Score;

import java.util.List;

public interface ScoreDao extends Dao {
    List<Score> findUserAllScore(int uid);

    Score finduserLastScore(int uid);

}
