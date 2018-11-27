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

        if(type==2) {
            //qn = dao.findList(" select c.result, c.ruid, u.userName from Comment c , User u where c.type=? and c.puid=? and u.uid=c.ruid", type, Utils.getUser().getUid() );
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
        System.out.println(users.get(0).toString());
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
