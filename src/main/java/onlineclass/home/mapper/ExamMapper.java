package onlineclass.home.mapper;

import onlineclass.home.model.Exam;
import tk.mybatis.mapper.common.Mapper;

public interface ExamMapper extends Mapper<Exam> {
    Exam getLastExam();
}
