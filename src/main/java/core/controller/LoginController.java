package core.controller;

import core.dao.UserDao;
import core.model.User;
import core.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Map;

@Controller
public class LoginController {


    private Map infoMap;
    //private Boolean courseFlag;

    @Resource(name = "userDaoImp")
    private UserDao userDao;


    @RequestMapping("/home/login")
    public ModelAndView login(String userName, String passWd) {
        String SUCCESS = "redirect:/tea/home";
        String ERROR = "core/login";
        String STU = "stu/stuhome";
        ModelAndView modelAndView = new ModelAndView();
        //  courseFlag = Utils.COURSE_OPING;
        System.out.println(userName);
        if (userName != null && passWd != null) {

            User vu = userDao.selectByUName(userName);
            System.out.println(vu);
            if (vu == null) {
                modelAndView.setViewName(ERROR);

            } else {

                if (vu.getPassWord().equals(passWd)) {
                    String token = Utils.saveUser(vu);
                    modelAndView.addObject("token", token);
                    modelAndView.addObject("user", vu);
                    if (vu.getRole().equals("stu"))
                        modelAndView.setViewName(STU);
                    else {
                        //Utils.TEACHER_ID = vu.getUid();
                        modelAndView.setViewName(SUCCESS);
                    }
                } else {
                    modelAndView.setViewName(ERROR);
                }

            }

        }
        // modelAndView.setViewName(ERROR);
        return modelAndView;
    }

}
