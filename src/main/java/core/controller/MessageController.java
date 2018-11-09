package core.controller;


import core.model.Message;
import core.model.User;
import core.msg.messager.PostOffice;
import core.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@Scope("prototype")

public class MessageController {

    String msg;
    @Autowired
    private PostOffice postOffice;

    @RequestMapping("sendM")
    public String sendMessage(int receiveid, int msgtype, String msg) {
        //  System.out.println(postOffice);
        if (msg != null) {

            User sender = Utils.getUser();
            Message message = new Message();
            message.setMessage(msg);
            message.setSender(sender);
            message.setReceiveId(receiveid);
            message.setTypes(msgtype + "");
            message.setSendTime(new Date() + "");

            postOffice.userSendMessage(message);

        }

        return "success";
    }

}
