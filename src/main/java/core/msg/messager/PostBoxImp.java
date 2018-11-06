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
    public void deliverMsg(PostMan man) {
        for (Message m : msgList) {
            man.sendMessagesToUser(m);
        }
    }
}
