package core.msg.messager;

import core.model.Message;
import core.msg.msgfilter.Channel;
import core.services.MessageServices;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PostOffice {

    public static Map usersPostBoxes = new HashMap<Integer, Channel>();

    private MessageServices messageServices;
    private PostHelper postHelper;
    private PostMan postMan;


    public void userSendMessage(Message msg) {

        int type = msg.getTypes() == null ? 0 : Integer.parseInt(msg.getTypes());

        if (type != Message.MessageType_PersonalMsg) {
            try {
                List<Integer> sendList = sortMessage(msg);
                for (int uid : sendList) {

                    postHelper.setChannel(getChannel(uid));
                    postHelper.getMessageSend(msg, uid);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            int uid = msg.getReceiveId();
            postHelper.setChannel(getChannel(uid));
            postHelper.getMessageSend(msg, uid);
        }


    }

    public void userReceiveMessage(int uid, int channelValue) {
        Channel channel = (Channel) usersPostBoxes.get(uid);
        if (channel == null)
            channel = new Channel();
        channel.switchChannel(channelValue);
        try {
            channel.startChannel(postMan);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private List<Integer> sortMessage(Message message) throws Exception {
        List list = new ArrayList();
        int type = message.getTypes() == null ? 0 : Integer.parseInt(message.getTypes());


        switch (type) {
           /* case Message.MessageType_PersonalMsg:
                if (message.getReceiveId()!=0)
                    throw new Exception("个人消息");
                else
                    throw new Exception("receiveId不能为0");
                break;*/
            case Message.MessageType_Broadcast:
               /* if (message.getReceiveId()!=0)*/
                if (message.getReceiveId() == 0) {
                    list.addAll(messageServices.getAllUserId());
                } else {
                    list.add(message.getReceiveId());
                }
                /*else
                    System.err.println("receiveId不能为0");*/
                break;
            case Message.MessageType_GroupMsg:
                if (message.getReceiveId() != 0)
                    list.add(messageServices.getUserIdInGroup(message.getReceiveId()));
                else
                    throw new Exception("receiveId不能为0");
                break;
            case Message.MessageType_SystemMsg:
                int receiveId = message.getReceiveId();
                if (receiveId == 0) {
                    list.add(messageServices.getAllUserId());
                } else {
                    list.add(receiveId);
                }
                break;
            default:
                if (message.getReceiveId() != 0)
                    throw new Exception("消息类型不能为空");
                else
                    throw new Exception("receiveId不能为0");
                // break;
        }
        return list;
    }

    private Channel getChannel(int uid) {
        if (usersPostBoxes.get(uid) == null) {
            Channel channel = new Channel();
            usersPostBoxes.put(uid, channel);
            return channel;
        } else {
            return (Channel) usersPostBoxes.get(uid);
        }
    }

}
