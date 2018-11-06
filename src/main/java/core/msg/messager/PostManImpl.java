package core.msg.messager;

import core.model.Message;
import core.msg.webSocket.WebSocketServer;

public class PostManImpl implements PostMan {

    private static int mid = 1;

    private WebSocketServer ws;


    private void refreshMid(Message message) {
        mid++;
        message.setMid(mid);
    }

    @Override
    public void sendMessagesToUser(Message m, int uid) {

        refreshMid(m);
        ws.sendMessageToUser(uid, m);
    }

    @Override
    public void sendMessagesToUser(Message m) {
        refreshMid(m);
        ws.sendMessageToUser(m.getReceiveId(), m);
    }
}
