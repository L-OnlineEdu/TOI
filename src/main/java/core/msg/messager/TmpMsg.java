package core.msg.messager;

import core.model.Message;

public class TmpMsg implements TemporalMsgs {
    PostOffice postOffice;

    @Override
    public void sendMessage(Message message) {
        postOffice.userSendMessage(message);
    }

}
