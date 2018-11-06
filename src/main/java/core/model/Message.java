package core.model;

public class Message {

    public static final int MessageType_Broadcast = 1;
    public static final int MessageType_GroupMsg = 2;
    public static final int MessageType_PersonalMsg = 3;
    public static final int MessageType_SystemMsg = 4;
    private int mid;
    private String types;
    private User sender;
    private String message;
    private int receiveId;
    private String sendTime;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getReceiveId() {
        return receiveId;
    }

    public void setReceiveId(int receiveId) {
        this.receiveId = receiveId;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }
}
