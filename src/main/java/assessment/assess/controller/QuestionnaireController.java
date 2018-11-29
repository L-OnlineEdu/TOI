package assessment.assess.controller;

import assessment.assess.dao.CommentDao;
import assessment.assess.model.Comment;
import core.dao.UserDao;
import core.model.User;
import core.msg.messager.PostMan;
import core.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class QuestionnaireController {
    private int pid;
    private List qn;
    private String SUCCESS = "1";
    @Autowired
    private CommentDao dao;
    @Autowired
    private PostMan postman;
    @Autowired
    private UserDao userdao;

    @RequestMapping("/ass/updateS")
    public void update(int cid, int result) {
        Comment c = new Comment();
        cid = Math.abs(cid);
        c = (Comment) dao.select(Comment.class, cid);
        c.setResult(result);
        dao.update(c);
    }



    @RequestMapping("/ass/saveS")
    public String saveScore(int type, int rid, int result) {
        Comment c = new Comment();
        c.setPuid(Utils.getUser().getUid());
        c.setRuid(rid);
        if (rid == 0) {
            c.setRuid(Utils.getUser().getUid());
        }
        c.setResult(result);
        c.setType(type);

        dao.add(c);
        return SUCCESS;
    }

    public String getQuestions() {

        qn = dao.selectAll();
        System.out.println(qn.size());
        return SUCCESS;
    }

    @RequestMapping("/ass/getQnRs")
    public List getResults(int type) {

        qn = dao.selectByTypeAndRuid(type, Utils.getUser().getUid());
        return qn;
    }

    public String getComments(int type) {

        qn = dao.selectByTypeAndRuid(type, Utils.getUser().getUid());
        System.out.println(qn.size());
        return SUCCESS;
    }


    @RequestMapping("/ass/getTesRs")
    public List getTeacherResult(int type) {
        qn = new ArrayList();
        if(type==2) {
            List us = dao.selectBypid(Utils.getUser().getUid());
            for (int i = 0; i < us.size(); i++) {
                Comment c = (Comment) us.get(i);
                qn.add(dao.selectRusers(c.getCid()).get(0));
            }

        }else{
            qn = dao.selectByTypeAndRuid(type, Utils.getUser().getUid());
        }
        return qn;
    }

    @RequestMapping("/ass/delRs")
    public void deleteResult(int cid) {

        dao.del(dao.select(Comment.class, cid));

    }


    @RequestMapping("/ass/allOnlineStu")
    public List getStudents() {
        List users = new ArrayList();
        List usernb = postman.getOnlineStudents();
        System.out.println(usernb.size() + "-----------" + usernb.get(0));
        for (int i = 0; i < usernb.size(); i++) {
            users.add(userdao.select(User.class, (int) usernb.get(i)));
        }
        return users;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public List getQn() {
        return qn;
    }

    public void setQn(List qn) {
        this.qn = qn;
    }
}
