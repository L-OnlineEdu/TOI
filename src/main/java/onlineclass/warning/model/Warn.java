package onlineclass.warning.model;


import core.model.User;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.annotation.KeySql;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Column;
import javax.persistence.Id;

@Component
@NameStyle(Style.normal)
public class Warn {
    @Id
    @Column(name = "wid")
    @KeySql(useGeneratedKeys = true)
    private int id;
    private User teacher;
    private User student;
    private String warnMessage;
    private int pointsOff;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }

    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public String getWarnMessage() {
        return warnMessage;
    }

    public void setWarnMessage(String warnMessage) {
        this.warnMessage = warnMessage;
    }

    public int getPointsOff() {
        return pointsOff;
    }

    public void setPointsOff(int pointsOff) {
        this.pointsOff = pointsOff;
    }

    @Override
    public String toString() {
        return "Warn{" +
                "id=" + id +
                ", teacher=" + teacher +
                ", student=" + student +
                ", warnMessage='" + warnMessage + '\'' +
                ", pointsOff=" + pointsOff +
                '}';
    }
}
