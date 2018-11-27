package onlineclass.home.model;


public class Question {

    public static final int QuestionType_SingleChoice = 1;
    public static final int QuestionType_TrueORFalse = 2;
    public static final int QuestionType_Other = 0;
    private int questionId;
    private String title;
    private String answers;
    private int type;
    private String rightAnswer;
    private int pid;

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAnswers() {
        return answers;
    }

    public void setAnswers(String answers) {
        this.answers = answers;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getRightAnswer() {
        return rightAnswer;
    }

    public void setRightAnswer(String rightAnswer) {
        this.rightAnswer = rightAnswer;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
}
