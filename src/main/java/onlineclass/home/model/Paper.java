package onlineclass.home.model;


import java.util.List;

public class Paper {
    private int pid;
    private String pname;
    private String pcontext;
    private String ptime;
    private List<Question> questions;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
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

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
}
