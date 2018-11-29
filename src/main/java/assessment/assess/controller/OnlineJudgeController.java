package assessment.assess.controller;

import core.model.User;
import core.msg.messager.PostMan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class OnlineJudgeController {
    private List<User> users;

    @Autowired
    private PostMan postman;


}
