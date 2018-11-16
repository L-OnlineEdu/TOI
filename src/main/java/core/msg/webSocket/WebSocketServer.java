package core.msg.webSocket;

import com.alibaba.fastjson.JSON;
import core.model.Message;
import core.msg.messager.PostOffice;
import core.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

@Component
@ServerEndpoint(value = "/ws/{fromUserId}/{channel}", configurator = SpringConfigurator.class)
public class WebSocketServer {
    // 已经建立链接的对象缓存起来
    private static ConcurrentMap<Integer, WebSocketServer> serverMap = new ConcurrentHashMap<Integer, WebSocketServer>();
    // 当前session
    private Session currentSession;
    @Autowired
    private PostOffice postOffice;

    @OnOpen
    public void onOpen(Session session, @PathParam("fromUserId") int fromUserId, @PathParam("channel") int channel) throws IOException {
        this.currentSession = session;
        serverMap.put(fromUserId, this);//建立链接时，缓存对象
        postOffice.userReceiveMessage(fromUserId, channel);
    }

    @OnClose
    public void onClose(Session session, CloseReason reason) {
        System.out.println(reason.toString());
        if (serverMap.containsValue(this)) {
            Iterator<Integer> keys = serverMap.keySet().iterator();
            int userId = 0;
            int uid = Utils.getUser().getUid();
            postOffice.userLeave(userId);
            while (keys.hasNext()) {
                userId = keys.next();
                if (serverMap.get(userId) == this) {
                    serverMap.remove(userId, this);//关闭链接时，删除缓存对象
                }
            }
        }
        this.currentSession = null;
        try {
            session.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @OnMessage()
    @SuppressWarnings("unchecked")
    public void onMessage(String json) {
        HashMap<String, String> map = JSON.parseObject(json, HashMap.class);
        int fromUserId = Integer.parseInt(map.get("fromUserId"));
        int toUserId = Integer.parseInt(map.get("toUserId"));
        String content = map.get("content").toString();
        WebSocketServer server = serverMap.get(toUserId);//若存在则用户在线，否在用户不在线
        if (server != null && server.currentSession.isOpen()) {
            if (fromUserId != toUserId) {
                try {
                    server.currentSession.getBasicRemote().sendText(content);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    public void sendMessageToUser(int uid, Message message) {
        int fromUserId = message.getSender().getUid();
        int toUserId = uid;
        String content = JSON.toJSONString(message);
        WebSocketServer server = serverMap.get(toUserId);//若存在则用户在线，否在用户不在线
        if (server != null && server.currentSession.isOpen()) {
            // if (fromUserId != toUserId) {
                try {
                    server.currentSession.getBasicRemote().sendText(content);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            // }
        }

    }


    @OnError
    public void onError(Throwable t) {
        t.printStackTrace();
    }

    public List getOnlineUserIds() {
        List list = new ArrayList();
        if (serverMap != null) {
            list.addAll(serverMap.keySet());
        }
        return list;
    }
}
