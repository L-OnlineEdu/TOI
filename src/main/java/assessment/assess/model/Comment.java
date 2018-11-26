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
public class Comment {
    @Id
    @KeySql(useGeneratedKeys = true)
    @Column(name = "cid")
    private int cid;
    private Integer puid;
    private Integer ruid;
    private Integer result;
    private Integer type;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Integer getPuid() {
        return puid;
    }

    public void setPuid(Integer puid) {
        this.puid = puid;
    }

    public Integer getRuid() {
        return ruid;
    }

    public void setRuid(Integer ruid) {
        this.ruid = ruid;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cid=" + cid +
                ", puid=" + puid +
                ", ruid=" + ruid +
                ", result=" + result +
                ", type=" + type +
                '}';
    }
}
