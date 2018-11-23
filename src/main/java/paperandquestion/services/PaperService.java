package paperandquestion.services;

import paperandquestion.model.Paper;

import java.util.List;

public interface PaperService {

    List<Paper> findAllPaper();
    int updatePaper(Paper paper);
    Paper getPaper(Integer pid);
    int addPaper(Paper paper);
    int deletePaper(Paper paper);

    int findPaperId();
}
