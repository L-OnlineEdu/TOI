package onlineclass.exam.controller;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import core.model.SystemMessage;
import core.model.User;
import core.msg.messager.TemporalMsgs;
import core.utils.Utils;
import onlineclass.exam.dao.ExamDao;
import onlineclass.exam.model.*;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
@Scope("prototype")

public class ExamController {
   /* 测验：提供选择试卷、试卷推送、答题、自动判卷、成绩汇总功能*/

    private ExamDao dao;
    private TemporalMsgs temporalMsgs;
    private int scores = 0;

    //显示所有试卷
    @RequestMapping("papers")
    public Map allPaper() {
        Map map = new HashMap();
        List paperList = dao.selectAll();
        String msg;
        if (paperList != null)
            msg = "success";
        else
            msg = "paper not exist";
        map.put("msg", msg);
        map.put("paperList", paperList);
        return map;
    }

    //展示试卷
    @RequestMapping("displaypaper")
    public Map displayPaper(int paperid) {
        Map map = new HashMap();
        List questionList = new ArrayList();
        String msg;
        Paper paper = (Paper) dao.select(Paper.class, paperid);

        if (paper != null) {
            questionList = paper.getQuestions();
            msg = "success";
        } else {
            msg = "null";
        }
        map.put("msg", msg);
        map.put("paper", paper);
        map.put("questionList", questionList);
        return map;
    }
    //推送试卷

    @RequestMapping("/tea/pushpaper")
    public Map pushPaper(int paperid, int examTime) {
        String msg;
        Map map = new HashMap();
        User sender = Utils.getUser();
        if (sender != null) {

            Exam exam = new Exam();
            exam.setStartTimes(new Timestamp(System.currentTimeMillis()) + "");
            exam.setTeacher(sender);
            exam.setPaper((Paper) dao.select(Paper.class, paperid));
            exam.setExamTime(examTime);
            dao.add(exam);
            System.out.println("eid:" + exam.getEid());
            SystemMessage systemMessage = new SystemMessage(SystemMessage.SystemMessageType_PaperPush,
                    sender, 0, "paperId," + paperid + ",examTime," + examTime);
            System.out.println(systemMessage);
            temporalMsgs.sendMessage(systemMessage);
            msg = "success";

        } else {
            msg = "error";
        }
        map.put("msg", msg);
        return map;
    }

    //完成试卷
    @RequestMapping("finishpaper")
    public String finishPaper() {

        User sender = Utils.getUser();

        SystemMessage systemMessage = new SystemMessage(SystemMessage.SystemMessageType_PaperFinish, sender, 0, "paperscore:" + scores);
        temporalMsgs.sendMessage(systemMessage);
        return "success";
    }

    //批改试卷计算成绩
    @RequestMapping("/stu/correctpaper")
    public Map correctPaper(int paperid, String answers) {

        Gson gson = new Gson();
        Paper p = (Paper) dao.select(Paper.class, paperid);
        List questionList = p.getQuestions();
        int rightNum = 0, wrongNum = 0;
        Map<Integer, String> rightAns = new HashMap<>();
        for (int i = 0; i < questionList.size(); i++) {
            rightAns.put(((Question) questionList.get(i)).getQuestionId(),
                    ((Question) questionList.get(i)).getRightAnswer());
        }
        Map<Integer, String> ansMap = gson.fromJson(answers, new TypeToken<Map<Integer, String>>() {
        }.getType());


        for (Map.Entry<Integer, String> entry : ansMap.entrySet()) {
            String answer = entry.getValue();

            String rightAnswer = rightAns.get(entry.getKey());
            int qtype = ((Question) dao.select(Question.class, entry.getKey())).getType();
            if (qtype == Question.QuestionType_Other) {
                if (answer.indexOf(rightAnswer) > -1) {
                    rightNum += 1;
                }
            } else {
                if (answer.equals(rightAnswer)) {
                    rightNum += 1;
                }
            }
            scores = rightNum;
        }
        wrongNum = questionList.size() - rightNum;

        Date day = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // System.out.println(df.format(day));

        Score score = new Score();
        score.setScore(scores);
        score.setDetials(answers);
        score.setStudent(Utils.getUser());
        score.setEndTime(df.format(day));
        //score.setEndTime(new Timestamp(System.currentTimeMillis())+"");

        Exam recordExam = dao.getLastExam();
        score.setExam(recordExam);
        dao.add(score);
        String msg;
        if (answers != null) {
            temporalMsgs.sendMessage(new SystemMessage(SystemMessage.
                    SystemMessageType_PaperFinish, Utils.getUser(),
                    recordExam.getTeacher().getUid(), "score:" + scores));
            msg = "success";
        } else {
            msg = "error";
        }
        Map map = new HashMap();
        map.put("msg", map);
        map.put("rightNum", rightNum);
        map.put("wrongNum", wrongNum);
        map.put("scores", scores);
        return map;
    }


    //成绩
    @RequestMapping("/tea/scores")
    public Map socres() {

        List<Score> scores = dao.selectAll();
        List scoresList = new ArrayList();
        for (Score score : scores) {
            ScoreReport scoreReport = new ScoreReport();
            scoreReport.setScore(score.getScore());
            scoreReport.setStu(score.getStudent().getUserName());
            scoreReport.setTea(score.getExam().getTeacher().getUserName());

            Timestamp startT = Timestamp.valueOf(score.getExam().getStartTimes());
            Timestamp endT = Timestamp.valueOf(score.getEndTime());
            int minutes = (int) ((endT.getTime() - startT.getTime()) / 60000);
            scoreReport.setTime(minutes + "");
            scoresList.add(scoreReport);
        }
        Map map = new HashMap();
        map.put("scoresList", scoresList);
        return map;
    }


}
