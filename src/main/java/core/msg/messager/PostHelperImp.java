package core.msg.messager;

import core.model.Message;
import core.model.SystemMessage;
import core.msg.msgfilter.Channel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PostHelperImp implements PostHelper {
    @Autowired
    private PostMan postMan;

    private Channel userChannel;


    private void putMessagesToPostBox(Message m, int uid) {

        userChannel.open(m);
    }

    private void callPostManForHelp(Message message, int uid) {

        postMan.sendMessagesToUser(message, uid);
        //putMessagesToPostBox(message,uid);
    }


    @Override
    public void setChannel(Channel channel) {
        this.userChannel = channel;
    }

    @Override
    public void getMessageSend(Message message, int uid) {
        System.out.println(message);
        int channel;
        if (message instanceof SystemMessage)
            channel = 1;
        else
            channel = 0;

        if (userChannel.isChannelOpened(channel)) {
            callPostManForHelp(message, uid);
        } else {
            putMessagesToPostBox(message, uid);
        }
    }
}
