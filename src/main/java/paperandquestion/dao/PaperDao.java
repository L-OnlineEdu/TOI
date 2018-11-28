package paperandquestion.dao;

import org.springframework.stereotype.Repository;
import paperandquestion.model.Paper;

import java.util.List;

@Repository
public interface PaperDao {
    Paper getPaper(Integer pid);
    int addPaper(Paper paper);
    int updatePaper(Paper paper);
    int deletePaper(Paper paper);
    List<Paper> findAllPaper();
}
