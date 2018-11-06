package core.msg.messager;

import core.model.Message;
import core.model.SystemMessage;
import core.msg.msgfilter.Channel;

public class PostHelperImp implements PostHelper {

    private PostMan postMan;
    private Channel userChannel;

    public Channel getUserChannel() {
        return userChannel;
    }


    /*public PostHelperImp(PostMan postMan, Channel userChannel) {
        this.postMan = postMan;
        this.userChannel = userChannel;
    }
    */

    private void putMessagesToPostBox(Message m, int uid) {

        userChannel.open(m);
    }

    private void callPostManForHelp(Message message, int uid) {

        postMan.sendMessagesToUser(message, uid);
    }


    @Override
    public void setChannel(Channel channel) {
        this.userChannel = channel;
    }

    @Override
    public void getMessageSend(Message message, int uid) {
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
