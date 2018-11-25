package onlineclass.home.controller;

import core.msg.messager.PostOffice;
import core.utils.Utils;
import onlineclass.exam.dao.ExamDao;
import onlineclass.exam.dao.ScoreDao;
import onlineclass.exam.model.Score;
import onlineclass.exam.model.ScoreReport;
import onlineclass.warning.dao.WarnDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class StudentInfoController {
    @Autowired
    ExamDao examDao;
    @Autowired
    WarnDao warnDao;
    @Autowired
    ScoreDao scoreDao;
    @Autowired
    PostOffice postOffice;

    @RequestMapping("/feedStu")
    public Map feedStu() {
        Map infoMap = new HashMap();
        int uid = Utils.getUser().getUid();
        Score myScore = scoreDao.finduserLastScore(uid);
        List<Score> scores = scoreDao.findUserAllScore(uid);
        if (myScore != null) {
            infoMap.put("myScore", myScore.getScore());
        }

        int onlineNum = postOffice.getOnlineNums();
        infoMap.put("onlineDiscuss", onlineNum);
        int sid = Utils.getUser().getUid();
        List warnList = warnDao.findStuWarning(sid);
        if (warnList != null)
            infoMap.put("warnNums", warnList.size());
        else infoMap.put("warnNums", 0);
        infoMap.put("warnList", warnList);
        infoMap.put("lastExam", examDao.getLastExam());
        List scoreResprtList = new ArrayList();
        for (Score score : scores) {
            ScoreReport scoreReport = new ScoreReport();
            scoreReport.setScore(score.getScore());
            scoreReport.setStu(score.getStudent().getUserName());
            scoreReport.setTea(score.getExam().getTeacher().getUserName());

            Timestamp startT = Timestamp.valueOf(score.getExam().getStartTimes());
            Timestamp endT = Timestamp.valueOf(score.getEndTime());
            int minutes = (int) ((endT.getTime() - startT.getTime()) / 60000);
            scoreReport.setTime(minutes + "");
            scoreResprtList.add(scoreReport);
        }
       /* infoMap.put("scoreReportList",scoreResprtList);
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("infoMap",infoMap);*/
        return infoMap;
    }
}
