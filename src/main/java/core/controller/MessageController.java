package core.controller;


import core.model.Message;
import core.model.User;
import core.msg.messager.TemporalMsgs;
import core.utils.Utils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
@Scope("prototype")

public class MessageController {

    String msg;
    private TemporalMsgs temporalMsgs;

    @RequestMapping("sendM")
    public String sendMessage(int receiveid, int msgtype, String msg) {
        System.out.println(temporalMsgs);
        if (msg != null) {

            User sender = Utils.getUser();
            Message message = new Message();
            message.setMessage(msg);
            message.setSender(sender);
            message.setReceiveId(receiveid);
            message.setTypes(msgtype + "");
            message.setSendTime(new Date() + "");
            temporalMsgs.sendMessage(message);

        }

        return "success";
    }

}
