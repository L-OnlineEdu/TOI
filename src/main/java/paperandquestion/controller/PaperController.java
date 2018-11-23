package paperandquestion.controller;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import paperandquestion.model.Paper;
import paperandquestion.model.Question;
import paperandquestion.services.PaperService;
import paperandquestion.services.QuestionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController("paperController")
//@Scope("prototype")
public class PaperController {
    //
    @Autowired
    private PaperService paperService;
    @Autowired
    private QuestionService questionService;


    public QuestionService getQuestionService() {
        return questionService;
    }

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }


    public PaperService getPaperService() {
        return paperService;
    }

    public void setPaperService(PaperService paperService) {
        this.paperService = paperService;
    }

    @RequestMapping(value = "tea/findAllPaper", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findAllPaper() {

        List<Paper> paperList = paperService.findAllPaper();
        System.out.println(new Gson().toJson(paperList));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("paperList", paperList);
        return new Gson().toJson(map);
    }

    @RequestMapping(value = "tea/updatePaper", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String updatePaper(@RequestParam("pcontext") String pcontexte, @RequestParam("ptime") String ptime, @RequestParam("pid") String pid) {
        Paper paper = paperService.getPaper(Integer.parseInt(pid));
        paper.setPcontext(pcontexte);
        paper.setPtime(ptime);
        paperService.updatePaper(paper);
        return "success";
    }

    @RequestMapping(value = "tea/deletePaper", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String deletePaper(@RequestParam String pid) {

        return "success";
    }

    @RequestMapping(value = "tea/addPaper", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addPaper(@RequestParam("pname") String pname, @RequestParam("pcontext") String pcontexte, @RequestParam("ptime") String ptime, @RequestParam("questionList") String questionList) {
        Paper paper = new Paper();
        paper.setPtime(ptime);
        paper.setPname(pname);
        paper.setPcontext(pcontexte);
        paperService.addPaper(paper);

        int pid = paper.getPid();
        System.out.println("ertyuiortyui   " + pid);/*
        JSONArray jsonArray = JSONArray.fromObject(questionList);
        List<String> list2 =JSONArray.toList(jsonArray);*/


        /*List<Paper> list2=JSON.parseArray(questionList,List<Paper>.class);*/
        Gson gson = new Gson();
        List<String> list2 = gson.fromJson(questionList, new TypeToken<List<String>>() {
        }.getType());
        for (int i = 0; i < list2.size(); i++) {
            int a = Integer.parseInt(list2.get(i));
            Question question = questionService.getQuestion(a);
            question.setPid(paper.getPid());
            questionService.updateQuestion(question);

        }
        return "success";
    }
}


