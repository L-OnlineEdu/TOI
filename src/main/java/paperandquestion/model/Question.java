package paperandquestion.model;

public class Question {
    private Integer questionid;
    private String answer;
    private String rightAnswer;
    private String title;
    private Integer pid;
    private Integer type;

    public Integer getQuestionid() {
        return questionid;
    }

    public void setQuestionid(Integer questionid) {
        this.questionid = questionid;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getRightAnswer() {
        return rightAnswer;
    }

    public void setRightAnswer(String rightAnswer) {
        this.rightAnswer = rightAnswer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Question{" +
                "questionid=" + questionid +
                ", answer='" + answer + '\'' +
                ", rightAnswer='" + rightAnswer + '\'' +
                ", title='" + title + '\'' +
                ", pid=" + pid +
                ", type=" + type +
                '}';
    }
}
