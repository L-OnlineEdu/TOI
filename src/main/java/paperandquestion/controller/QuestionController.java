package paperandquestion.controller;


import com.google.gson.Gson;
import org.springframework.web.bind.annotation.*;
import paperandquestion.model.Question;
import paperandquestion.services.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

@RestController("questionController")
//@Scope("prototype")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    public QuestionService getQuestionService() {
        return questionService;
    }

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }

    @RequestMapping(value = "tea/getQuestion",produces ="text/html;charset=UTF-8")
    @ResponseBody
    public String getQuestion(@RequestParam("questionid") String questionid){
        Question question = questionService.getQuestion(Integer.parseInt(questionid));
        return new Gson().toJson(question);
    }
    @RequestMapping(value = "tea/deleteQuestion",produces ="text/html;charset=UTF-8")
    @ResponseBody
    public String deleteQuestion(@RequestParam("questionid") String questionid){
        Question question = new Question();
        question.setQuestionid(Integer.parseInt(questionid));
        questionService.deleteQuestion(question);
        return "success";
    }

    @RequestMapping(value = "tea/updateQuestion",produces ="text/html;charset=UTF-8")
    public String updateQuestion(@RequestParam("questionid") String questionid,@RequestParam("answer") String answer,@RequestParam("rightAnswer") String rightAnswer,@RequestParam("title") String title){
        Question question = questionService.getQuestion(Integer.parseInt(questionid));
        question.setAnswer(answer);
        question.setRightAnswer(rightAnswer);
        question.setTitle(rightAnswer);
        question.setType(1);
        questionService.updateQuestion(question);
        return  "success";
    }





}
