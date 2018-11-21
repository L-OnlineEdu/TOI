package core.msg.msgfilter;

import core.model.Message;
import core.model.SystemMessage;
import core.msg.messager.PostBox;
import core.msg.messager.PostBoxImp;
import core.msg.messager.PostMan;
import org.springframework.stereotype.Component;

@Component
public class Channel {

    public static int CHAT_MESSAGE = 0;
    public static int SYSTEM_MESSAGE = 1;
    public static int ALL_CHANNEL = 2;
    public static int UNOPEN_CHANNEL = 9;

    private PostBox chatPostBox = new PostBoxImp();

    private PostBox sysmsgPostBox = new PostBoxImp();

    private int channelOpened = UNOPEN_CHANNEL;

    public void open(Message message) {
        if (message instanceof SystemMessage) {
            sysmsgPostBox.putMsg(message);
        } else {
            chatPostBox.putMsg(message);
        }
    }

    public void switchChannel(int channelOpened) {

        this.channelOpened = channelOpened;
    }

    public void startChannel(PostMan postMan, int uid) throws Exception {
        if (channelOpened == 9) {
            throw new Exception("channel not open");
        }
        System.out.println("channel: " + channelOpened);
        if (channelOpened == CHAT_MESSAGE)
            chatPostBox.deliverMsg(postMan, uid);
        else if (channelOpened == SYSTEM_MESSAGE)
            sysmsgPostBox.deliverMsg(postMan, uid);
        else {
            System.out.println(chatPostBox == null);
            chatPostBox.deliverMsg(postMan, uid);
            sysmsgPostBox.deliverMsg(postMan, uid);
        }

    }

    public Boolean isChannelOpened(int channel) {
        return channelOpened == ALL_CHANNEL || channelOpened == channel;
    }

}
