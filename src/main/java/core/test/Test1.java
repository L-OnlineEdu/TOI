package core.test;

import paperandquestion.dao.PaperDao;
import paperandquestion.model.Paper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class Test1 {

    public static  void main(String [] args){


        SqlSessionFactory sqlSessionFactory = null;
        String resource = "mybatis-config.xml";
        SqlSession sqlSession = null;
        try {
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory =  new SqlSessionFactoryBuilder().build(inputStream);
            sqlSession = sqlSessionFactory.openSession();
            PaperDao paperDao = sqlSession.getMapper(PaperDao.class);
            List<Paper> papers = paperDao.findAllPaper();
            for (int i = 0;i<papers.size();i++){
                System.out.println(papers.get(i).toString());
            }

           /* QuestionDao questionDao = sqlSession.getMapper(QuestionDao.class);
            Question question = questionDao.getQuestion(2);
            System.out.println(question.toString());
            question.setRightAnswer("C");
            questionDao.updateQuestion(question);
            Question question1 = questionDao.getQuestion(2);
            System.out.println(question1.toString());*/
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
