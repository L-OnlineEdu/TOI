package core.msg.messager;

import core.model.Message;
import core.msg.msgfilter.Channel;

public interface PostHelper {
    void setChannel(Channel channel);

    void getMessageSend(Message message, int uid);
}
