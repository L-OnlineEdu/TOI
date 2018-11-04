package onlineclass.discuss.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@Controller
@Scope("prototype")
@RestController
public class DiscussController {
    public static String SUCCESS = "success";
    private int messagetype;
    private int senderUid;
    private int receverid;
    private int beAsked;
    private String messageDetial;
    private String msg;
    private List stuList;
    //@Autowired
    //private TemporalMsgs temporalMsgs;
 /*   讨论：提供小组讨论、单独讨论、课堂讨论、举手、教师提问功能*/

    @RequestMapping("discux")
    public String sendMessage() {
     /*   if (messageDetial!=null){
            User sender= Utils.getUser();
            Message message=new Message();
            message.setMessage(messageDetial);
            message.setSender(sender);
            message.setReceiveId(receverid);
            message.setTypes(messagetype+"");
            message.setSendTime(new Date()+"");
         temporalMsgs.sendMessage(message);
           // System.out.println("map:"+temporalMsgs.getMsgMap());
        }*/
        return SUCCESS;
    }
/*





    //提问
    @RequestMapping("askQ")
    public String askQ(){
        User sender= Utils.getUser();
       // User userBeAsked= (User) new Dao().select(User.class,beAsked);
        SystemMessage message=new SystemMessage(SystemMessage.SystemMessageType_AskQ,sender,beAsked,messageDetial);
       temporalMsgs.sendMessage(message);
       // System.out.println("map:"+temporalMsgs.getMsgMap());
        return SUCCESS;
    }


    //回答
    @RequestMapping("ansQ")
    public String ansQ(){
        User sender= Utils.getUser();
        // User userBeAsked= (User) new Dao().select(User.class,beAsked);
        SystemMessage message=new SystemMessage(SystemMessage.SystemMessageType_AnsQ,sender,receverid,messageDetial);
        temporalMsgs.sendMessage(message);
        // System.out.println("map:"+temporalMsgs.getMsgMap());
        msg="success";
        return SUCCESS;
    }



    //举手

    @RequestMapping("hdup")
    public String handsUp(){
        User sender= Utils.getUser();
      //  User userBeAsked= (User) new Dao().select(User.class,beAsked);
       */
/* Message message=new Message();
        message.setMessage("handsUp:"+userBeAsked);
        message.setSender(sender);
        message.setReceiveId(receverid);
        message.setTypes(Message.MessageType_SystemMsg+"");*//*

        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_HandsUp,sender,beAsked,messageDetial);
       temporalMsgs.sendMessage(systemMessage);
       // System.out.println("map:"+temporalMsgs.getMsgMap());
        msg="success";
        return SUCCESS;
    }

    //学生列表

    @RequestMapping("stuList")
    public String stuList(){
        Dao dao=new Dao();
        stuList=dao.selectAll("User u where u.role='stu'");
        return SUCCESS;
    }
*/


    public int getMessagetype() {
        return messagetype;
    }

    public void setMessagetype(int messagetype) {
        this.messagetype = messagetype;
    }

    public int getSenderUid() {
        return senderUid;
    }

    public void setSenderUid(int senderUid) {
        this.senderUid = senderUid;
    }

    public int getReceverid() {
        return receverid;
    }

    public void setReceverid(int receverid) {
        this.receverid = receverid;
    }

    public int getBeAsked() {
        return beAsked;
    }

    public void setBeAsked(int beAsked) {
        this.beAsked = beAsked;
    }

    public String getMessageDetial() {
        return messageDetial;
    }

    public void setMessageDetial(String messageDetial) {
        this.messageDetial = messageDetial;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List getStuList() {
        return stuList;
    }

    public void setStuList(List stuList) {
        this.stuList = stuList;
    }
}
