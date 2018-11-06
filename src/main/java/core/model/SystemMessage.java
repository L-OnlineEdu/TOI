package core.model;

import java.util.Date;

public class SystemMessage extends Message {
    public static final int SystemMessageType_AskQ = 1;
    public static final int SystemMessageType_HandsUp = 2;
    public static final int SystemMessageType_PaperPush = 3;
    public static final int SystemMessageType_PracticePush = 14;
    public static final int SystemMessageType_PaperFinish = 4;
    public static final int SystemMessageType_Warn = 5;
    public static final int SystemMessageType_AnsQ = 6;
    public static final int SystemMessageType_Other = 7;

    public static final int SystemMessageType_CheckAted = 8;
    public static final int SystemMessageType_Cour = 9;
    public static final int SystemMessageType_Exit = 10;
    public static final int SystemMessageType_Pushques = 11;
    public static final int SystemMessageType_SubAsw = 12;
    public static final int SystemMessageType_ConnectionEstablished = 0;
    public static final int SystemMessageType_JoinCours = 15;
    public static final int SystemMessageType_questionNair = 16;
    private int systemMessageType;
    private int beAlertId;

    public SystemMessage(int systemMessageType, User sender, int beSend, String message) {
        setTypes(Message.MessageType_SystemMsg + "");
        setSender(sender);
        setSendTime(new Date() + "");
        setSystemMessageType(systemMessageType);
        setMessage(message);
        switch (systemMessageType) {
            case SystemMessageType_AskQ:
            case SystemMessageType_HandsUp:
            case SystemMessageType_Warn:
                beAlertId = beSend;
                setReceiveId(beAlertId);
                //setReceiveId(0);
                break;
            default:
                setReceiveId(beSend);
                break;
        }

    }


    public int getBeAlertId() {
        return beAlertId;
    }

    public void setBeAlertId(int beAlertId) {
        this.beAlertId = beAlertId;
    }

    public int getSystemMessageType() {
        return systemMessageType;
    }

    public void setSystemMessageType(int systemMessageType) {
        this.systemMessageType = systemMessageType;
    }
}
