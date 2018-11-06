package onlineclass.discuss.controller;

import com.alibaba.fastjson.JSON;
import core.dao.Dao;
import core.model.Message;
import core.model.SystemMessage;
import core.model.User;
import core.msg.messager.TemporalMsgs;
import core.utils.Utils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;


@Controller
@Scope("prototype")
@RestController
public class DiscussController {

    private TemporalMsgs temporalMsgs;
    private Dao dao;
    //@Autowired
    //private TemporalMsgs temporalMsgs;
 /*   讨论：提供小组讨论、单独讨论、课堂讨论、举手、教师提问功能*/

    @RequestMapping("discux")
    public String sendMessage(String messageDetial, int receverid, int messagetype) {
        if (messageDetial != null) {
            User sender= Utils.getUser();
            Message message=new Message();
            message.setMessage(messageDetial);
            message.setSender(sender);
            message.setReceiveId(receverid);
            message.setTypes(messagetype+"");
            message.setSendTime(new Date()+"");
         temporalMsgs.sendMessage(message);
           // System.out.println("map:"+temporalMsgs.getMsgMap());
        }
        return "success";
    }






    //提问
    @RequestMapping("askQ")
    public String askQ(int beAsked, String messageDetial) {
        User sender= Utils.getUser();
       // User userBeAsked= (User) new Dao().select(User.class,beAsked);
        SystemMessage message=new SystemMessage(SystemMessage.SystemMessageType_AskQ,sender,beAsked,messageDetial);
       temporalMsgs.sendMessage(message);
       // System.out.println("map:"+temporalMsgs.getMsgMap());
        return "success";
    }


    //回答
    @RequestMapping("ansQ")
    public String ansQ(int receverid, String messageDetial) {
        User sender= Utils.getUser();
        // User userBeAsked= (User) new Dao().select(User.class,beAsked);
        SystemMessage message=new SystemMessage(SystemMessage.SystemMessageType_AnsQ,sender,receverid,messageDetial);
        temporalMsgs.sendMessage(message);
        // System.out.println("map:"+temporalMsgs.getMsgMap());
        String msg = "success";
        return JSON.toJSONString(msg);
    }



    //举手

    @RequestMapping("hdup")
    public String handsUp(int beAsked, String messageDetial) {
        User sender= Utils.getUser();
      //  User userBeAsked= (User) new Dao().select(User.class,beAsked);
        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_HandsUp,sender,beAsked,messageDetial);
        temporalMsgs.sendMessage(systemMessage);
        // System.out.println("map:"+temporalMsgs.getMsgMap());
        String msg = "success";
        return JSON.toJSONString(msg);
    }

    //学生列表

    @RequestMapping("stuList")
    public String stuList(){

        List stuList = dao.selectAll("User u where u.role='stu'");
        return JSON.toJSONString(stuList);
    }


}
