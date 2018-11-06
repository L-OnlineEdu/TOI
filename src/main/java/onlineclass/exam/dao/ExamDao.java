package onlineclass.exam.dao;

import core.dao.Dao;
import onlineclass.exam.model.Exam;

public interface ExamDao extends Dao {
    Exam getLastExam();
}
