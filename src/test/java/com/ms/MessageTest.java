package com.ms;

import core.model.Message;
import core.model.User;
import core.msg.webSocket.WebSocketServer;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MessageTest {
    private ClassPathXmlApplicationContext context;

    @Test
    public void mTest() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        WebSocketServer ws = context.getBean(WebSocketServer.class);
        Message message = new Message();
        User u = new User();
        u.setUserName("aaa");
        message.setSender(u);
        message.setMessage("2222");
        message.setTypes(Message.MessageType_Broadcast + "");
        ws.sendMessageToUser(3, message);
    }
}
