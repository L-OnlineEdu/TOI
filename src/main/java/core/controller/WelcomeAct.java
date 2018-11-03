package core.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeAct {
    private static final Log logger = LogFactory.getLog(WelcomeAct.class);

    @RequestMapping(value = "/")
    public ModelAndView hello() {
        logger.info("hello() 方法被调用");
        ModelAndView mv = new ModelAndView();
        mv.addObject("title", "欢迎界面");
        mv.addObject("message", "Hello, world!");
        mv.setViewName("index");
        return mv;
    }
}
