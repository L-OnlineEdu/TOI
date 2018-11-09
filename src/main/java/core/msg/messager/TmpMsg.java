package core.msg.messager;

import core.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TmpMsg implements TemporalMsgs {
    @Autowired
    PostOffice postOffice;

    @Override
    public void sendMessage(Message message) {
        postOffice.userSendMessage(message);
    }

}
