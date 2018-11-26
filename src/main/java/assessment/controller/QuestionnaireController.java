package assessment.controller;

import assessment.model.Comment;
import core.utils.Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class QuestionnaireController {
    private int pid;
    private int rid;
    private int result;
    private int type;
    private List qn;
    private String SUCCESS = "1";

    public String saveScore() {
        Comment c = new Comment();
        c.setPuid(Utils.getUser().getUid());
        c.setRuid(rid);
        if (rid == 0) {
            c.setRuid(Utils.getUser().getUid());
        }
        c.setResult(result);
        c.setType(type);
        /*BaseDao dao=new ImplAddTs();
        dao.save(c);*/
        return SUCCESS;
    }

    public String getQuestions() {
      /*  BaseDao dao=new ImplAddTs();
        qn=dao.findList("from Questionnaire");*/
        System.out.println(qn.size());
        return SUCCESS;
    }

    @RequestMapping("/ass/getQnRs")
    public String getResults() {
      /*  BaseDao dao=new ImplAddTs();
        qn=dao.findList(" select c from Comment c where c.type=? and c.ruid=?", type, Utils.getUser().getUid());*/
        System.out.println("马上就出结果");
        System.out.println(qn.size());
        return SUCCESS;
    }

    public String getStudents() {
       /* BaseDao dao=new ImplAddTs();
        qn=dao.findList(" select c from Comment c where c.type=? and c.ruid=?", type, Utils.getUser().getUid());*/
        System.out.println(qn.size());
        return SUCCESS;
    }

    public String getTeacherResult() {
      /*  BaseDao dao=new ImplAddTs();
        if(type==2) {
            qn = dao.findList(" select c.result, c.ruid, u.userName from Comment c , User u where c.type=? and c.puid=? and u.uid=c.ruid", type, Utils.getUser().getUid() );
        }else{
            qn = dao.findList(" select c.result from Comment c where c.ruid=?",  Utils.getUser().getUid());
        }*/
        return SUCCESS;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }


    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public List getQn() {
        return qn;
    }

    public void setQn(List qn) {
        this.qn = qn;
    }
}
