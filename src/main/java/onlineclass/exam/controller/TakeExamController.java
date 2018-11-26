package onlineclass.exam.controller;

import onlineclass.exam.dao.ExamDao;
import onlineclass.exam.model.Exam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


public class TakeExamController {
    @Autowired
    ExamDao examDao;
    //学生考试
    @RequestMapping("/stu/takeExam")
    public ModelAndView takeExam(int examTime, int examid) {

        Exam exam = (Exam) examDao.select(Exam.class, examid);
        int paperid = exam.getPaper().getPid();
        int restSec = examTime * 60;
        String examTimeStr;
        if (restSec >= 0) {
            int hh = restSec / 3600;
            int mm = (restSec - hh * 3600) / 60;
            int ss = restSec % 60;
            examTimeStr = (hh < 10 ? "0" + hh : hh) + ":" + (hh < 10 ? "0" + mm : mm) + ":" + (ss < 10 ? "0" + ss : ss);
        } else {
            examTimeStr = "00:00:00";
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/stu/stu");
        mv.addObject("examTimeStr", examTimeStr);
        return mv;
    }
}
