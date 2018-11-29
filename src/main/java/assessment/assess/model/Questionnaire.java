package assessment.assess.model;

import org.springframework.stereotype.Component;
import tk.mybatis.mapper.annotation.KeySql;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Component
@Table(name = "comment")
@NameStyle(Style.normal)
public class Questionnaire {
    @Id
    @KeySql(useGeneratedKeys = true)
    @Column(name = "qid")
    private int questionId;
    private String questionTitle;
    private String questionItems;


    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestionTitle() {
        return questionTitle;
    }

    public void setQuestionTitle(String questionTitle) {
        this.questionTitle = questionTitle;
    }

    public String getQuestionItems() {
        return questionItems;
    }

    public void setQuestionItems(String questionItems) {
        this.questionItems = questionItems;
    }
}
