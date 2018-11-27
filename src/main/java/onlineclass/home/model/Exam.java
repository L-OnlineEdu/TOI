package onlineclass.home.model;


import core.model.User;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Component
@NameStyle(Style.normal)
@Table(name = "exams")
public class Exam {
    @Id
    @Column(name = "eid")
    private int eid;
    private String startTimes;
    private int examTime;

    private Paper paper;
    private User teacher;

    public int getExamTime() {
        return examTime;
    }

    public void setExamTime(int examTime) {
        this.examTime = examTime;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getStartTimes() {
        return startTimes;
    }

    public void setStartTimes(String startTimes) {
        this.startTimes = startTimes;
    }

    public Paper getPaper() {
        return paper;
    }

    public void setPaper(Paper paper) {
        this.paper = paper;
    }

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }

    @Override
    public String toString() {
        return "Exam{" +
                "eid=" + eid +
                ", startTimes='" + startTimes + '\'' +
                ", examTime=" + examTime +
                ", paper=" + paper +
                ", teacher=" + teacher +
                '}';
    }
}
