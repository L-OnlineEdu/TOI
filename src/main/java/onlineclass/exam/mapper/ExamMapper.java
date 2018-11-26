package onlineclass.exam.mapper;

import onlineclass.exam.model.Exam;
import tk.mybatis.mapper.common.Mapper;

public interface ExamMapper extends Mapper<Exam> {
    Exam getLastExam();
}
