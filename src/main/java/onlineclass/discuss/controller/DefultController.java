package onlineclass.discuss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefultController {
    @RequestMapping("/tea/discuss")
    String discux() {
        return "tea/discuss/discuss";
    }
}
