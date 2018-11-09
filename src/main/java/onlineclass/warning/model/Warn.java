package onlineclass.warning.model;


import core.model.User;

public class Warn {
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
}
