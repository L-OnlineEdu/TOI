package core.msg.messager;

import core.model.Message;

public interface PostMan {
    void sendMessagesToUser(Message m, int uid);

    void sendMessagesToUser(Message m);

    int getOnlineNums();
}
