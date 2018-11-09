package onlineclass.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PushPaperController {
    @RequestMapping("/tea/ppaper")
    public String ppaper() {
        return "tea/pushpaper";
    }
}
