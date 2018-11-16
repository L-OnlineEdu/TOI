package paperandquestion.services;

import paperandquestion.dao.QuestionDao;
import paperandquestion.model.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
//@Scope("prototype")
public class QuestionServiceImpl implements QuestionService {

  @Autowired
    private QuestionDao questionDao;

    public QuestionDao getQuestionDao() {
        return questionDao;
    }

    public void setQuestionDao(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    public Question getQuestion(Integer questionid) {
        return questionDao.getQuestion(questionid);

    }

    @Override
    public int addQuestion(Question question) {
        return questionDao.addQuestion(question);
    }

    @Override
    public int deleteQuestion(Question question) {
        return questionDao.deleteQuestion(question);
    }

    @Override
    public int updateQuestion(Question question) {
        return questionDao.updateQuestion(question);
    }

    @Override
    public List<Question> findAllQuestion(int pid) {
        return questionDao.findAllQuestion(pid);
    }
}
