package core.msg.messager;

import core.model.Message;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class PostBoxImp implements PostBox {

    private List<Message> msgList = new ArrayList();

    @Override
    public void putMsg(Message message) {

        msgList.add(message);
    }

    @Override
    public void deliverMsg(PostMan man, int uid) {
        for (Message m : msgList) {
            man.sendMessagesToUser(m, uid);
        }
        msgList.clear();
    }

    @Override
    public Boolean isEmpty() {
        return msgList.size() == 0;
    }

}
