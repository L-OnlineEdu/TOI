package paperandquestion.dao;

import paperandquestion.model.Paper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaperDao {
    public Paper getPaper(Integer pid);
    public int addPaper(Paper paper);
    public int updatePaper(Paper paper);
    public int deletePaper(Paper paper);
    public List<Paper> findAllPaper();
}
