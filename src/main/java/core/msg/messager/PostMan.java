package core.msg.messager;

import core.model.Message;

import java.util.List;

public interface PostMan {
    void sendMessagesToUser(Message m, int uid);

    void sendMessagesToUser(Message m);

    int getOnlineNums();

    List getOnlineStudents();
}
