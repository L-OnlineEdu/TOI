package onlineclass.exam.model;


import core.model.User;

public class Score {

    private int scoreId;

    private User student;

    private String endTime;

    private Exam exam;

    private int score;

    private String detials;

    public String getDetials() {
        return detials;
    }

    public void setDetials(String detials) {
        this.detials = detials;
    }

    public int getScoreId() {
        return scoreId;
    }

    public void setScoreId(int scoreId) {
        this.scoreId = scoreId;
    }

    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }


    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }
}
