package paperandquestion.dao;

import paperandquestion.model.Question;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface QuestionDao {

    public int addQuestion(Question question);
    public int updateQuestion(Question question);
    public int deleteQuestion(Question question);
    public Question getQuestion(Integer questionid);
    public List<Question> findAllQuestion(int pid);

}
