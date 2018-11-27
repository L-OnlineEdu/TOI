package onlineclass.home.dao;

import core.dao.Dao;
import onlineclass.home.model.Exam;

public interface ExamDao extends Dao {
    Exam getLastExam();

    Exam isThereBeExams(int uid);
}
