package assessment.assess.controller;

import core.model.SystemMessage;
import core.model.User;
import core.msg.messager.TemporalMsgs;
import core.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class QuestionnaireMsgController {
    @Autowired
    private TemporalMsgs temporalMsgs;
    private String SUCCESS = "1";

    @RequestMapping("/ass/sendTsM")
    public String sendTsMessage(String msg, int receiveid) {
        if (msg != null) {

            User sender = Utils.getUser();
            SystemMessage message = new SystemMessage(SystemMessage.SystemMessageType_questionNair, sender, receiveid, msg);
            System.out.println(temporalMsgs == null);
            temporalMsgs.sendMessage(message);
        }
        return SUCCESS;
    }

    @RequestMapping("/ass/sendSsm")
    public String sendSsMessage(String msg, String rids) {
        int senderid = 0;
        int receiveid = 0;
        if (msg != null) {
            String[] rs = rids.split(";");
            for (int i = 0; i < rs.length; i++) {
                if (i == rs.length - 1) {
                    senderid = Integer.parseInt(rs[0]);
                } else {
                    senderid = Integer.parseInt(rs[i + 1]);
                }
                receiveid = Integer.parseInt(rs[i]);
                User sender = Utils.getUser();
                SystemMessage message = new SystemMessage(SystemMessage.SystemMessageType_questionNair, sender, receiveid, msg + senderid);

                System.out.println(receiveid + "-----" + senderid + "----" + msg);

                temporalMsgs.sendMessage(message);

            }

        }

        return SUCCESS;

    }


}
