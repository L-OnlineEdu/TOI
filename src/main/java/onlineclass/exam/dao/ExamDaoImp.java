package onlineclass.exam.dao;

import onlineclass.exam.mapper.ExamMapper;
import onlineclass.exam.mapper.ScoreMapper;
import onlineclass.exam.model.Exam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public class ExamDaoImp implements ExamDao {
    @Autowired
    ExamMapper examMapper;
    @Autowired
    ScoreMapper scoreMapper;

    @Override
    public Exam getLastExam() {
        return examMapper.getLastExam();
    }

    @Override
    public List selectAll(String sql) {
        return examMapper.selectAll();
    }

    @Override
    public Object select(Class c, int id) {
        return examMapper.selectByPrimaryKey(id);
    }

    @Override
    public void add(Object object) {
        examMapper.insert((Exam) object);
    }

    @Override
    public void del(Object x) {
        examMapper.delete((Exam) x);
    }

    @Override
    public Exam isThereBeExams(int uid) {

        Exam ex = getLastExam();
        List scores = scoreMapper.findUserAllScore(uid);


        if (ex != null && (scores == null || scores.size() == 0)) {
            if (ex.getStartTimes() != null && !ex.getStartTimes().equals("")) {
                Timestamp startTime = Timestamp.valueOf(ex.getStartTimes());
                // Timestamp nowTime=new Timestamp(System.currentTimeMillis());
                int second = (int) ((System.currentTimeMillis() - startTime.getTime()) / 1000);
                int restSec = ex.getExamTime() * 60 - second;

                if (restSec > 0) {
                    return ex;
                } else {
                    return null;
                }
            } else {
                return null;
            }

        }
        return null;
    }
}
