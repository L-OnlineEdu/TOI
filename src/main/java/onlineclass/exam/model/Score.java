package onlineclass.exam.model;


import core.model.User;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.annotation.KeySql;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;


@Component
@NameStyle(Style.normal)
@Table(name = "scores")
public class Score {
    @Id
    @Column(name = "scoreId")
    @KeySql(useGeneratedKeys = true)
    private int scoreId;


    private String endTime;


    private int score;

    private String detials;

    private User student;
    private Exam exam;

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

    @Override
    public String toString() {
        return "Score{" +
                "scoreId=" + scoreId +
                ", endTime='" + endTime + '\'' +
                ", score=" + score +
                ", detials='" + detials + '\'' +
                ", student=" + student +
                ", exam=" + exam +
                '}';
    }
}
