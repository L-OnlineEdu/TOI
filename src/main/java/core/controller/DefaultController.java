package core.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {
    @RequestMapping("login")
    public String login() {
        return "/core/login";
    }

    @RequestMapping("/tea/two")
    public String two() {
        return "/tea/two";
    }

    @RequestMapping("/tea/home")
    public String teahome() {
        return "tea/home";
    }
}
