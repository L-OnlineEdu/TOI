package core.msg.messager;

import core.model.Message;


public interface PostBox {

    void putMsg(Message message);

    void deliverMsg(PostMan man, int uid);

}
