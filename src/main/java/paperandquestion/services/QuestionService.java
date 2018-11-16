package paperandquestion.services;


import paperandquestion.model.Question;

import java.util.List;


public interface QuestionService {

     Question getQuestion(Integer questionid) ;
     int addQuestion(Question question);
     int deleteQuestion(Question question);
     int updateQuestion(Question question);
     List<Question> findAllQuestion(int pid);
}