package core.controller;

import core.model.User;
import core.utils.Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class AutoLoginController {
    @RequestMapping("/core/autologin")
    public Map autoLogin(String token) {

        User user = Utils.getUser(token);
        String msg;
        if (user == null) {
            msg = "error";
        } else {
            msg = "success";
        }
        Map data = new HashMap<>();
        data.put("msg", msg);
        data.put("user", user);
        return data;
    }
}
