package paperandquestion.model;

import java.util.List;

public class Paper {
   private Integer pid;
   private String pname;
   private String pcontext;
   private String ptime;
   private List<Question> questionList;

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPcontext() {
        return pcontext;
    }

    public void setPcontext(String pcontext) {
        this.pcontext = pcontext;
    }

    public String getPtime() {
        return ptime;
    }

    public void setPtime(String ptime) {
        this.ptime = ptime;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", pcontext='" + pcontext + '\'' +
                ", ptime='" + ptime + '\'' +
                '}';
    }
}
