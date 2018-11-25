package onlineclass.exam.mapper;

import onlineclass.exam.model.Score;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ScoreMapper extends Mapper<Score> {
    List<Score> findUserAllScore(int uid);

    Score finduserLastScore(int uid);
}
