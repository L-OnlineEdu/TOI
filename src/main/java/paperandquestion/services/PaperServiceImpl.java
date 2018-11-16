package paperandquestion.services;

import paperandquestion.dao.PaperDao;
import paperandquestion.model.Paper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
//@Scope("prototype")
public class PaperServiceImpl implements PaperService  {

    @Autowired
    private PaperDao paperDao;

    public PaperDao getPaperDao() {
        return paperDao;
    }

    public void setPaperDao(PaperDao paperDao) {
        this.paperDao = paperDao;
    }

    @Override
    public List<Paper> findAllPaper() {
        return paperDao.findAllPaper();
    }

    @Override
    public int updatePaper(Paper paper) {
        return paperDao.updatePaper(paper);
    }

    @Override
    public Paper getPaper(Integer pid) {
        return paperDao.getPaper(pid);
    }

    @Override
    public int addPaper(Paper paper) {
        return paperDao.addPaper(paper);
    }

    @Override
    public int deletePaper(Paper paper) {
        return paperDao.deletePaper(paper);
    }
}
