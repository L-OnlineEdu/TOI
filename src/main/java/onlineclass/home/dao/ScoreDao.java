package onlineclass.home.dao;

import core.dao.Dao;
import onlineclass.home.model.Score;

import java.util.List;

public interface ScoreDao extends Dao {
    List<Score> findUserAllScore(int uid);

    Score finduserLastScore(int uid);

}
