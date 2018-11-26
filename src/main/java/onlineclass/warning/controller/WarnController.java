package onlineclass.warning.controller;

import com.alibaba.fastjson.JSON;
import core.dao.Dao;
import core.model.SystemMessage;
import core.model.User;
import core.msg.messager.TemporalMsgs;
import core.utils.Utils;
import onlineclass.warning.model.Warn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Scope("prototype")

public class WarnController {

    @Autowired
    private TemporalMsgs temporalMsgs;
    //TO DO
    @Autowired
    @Qualifier("warnDao")
    private Dao dao;

    @RequestMapping("warn")
    public String warn(int punish, int beWarned, String reason) {
        User teacher = Utils.getUser();
        SystemMessage systemMessage = new SystemMessage(SystemMessage.SystemMessageType_Warn, teacher, beWarned, reason);
        if (punish > 0) {

            Warn warn = new Warn();
            warn.setTeacher(teacher);
            warn.setStudent((User) dao.select(User.class, beWarned));
            warn.setPointsOff(punish);
            warn.setWarnMessage(reason);
            dao.add(warn);
            systemMessage.setMessage("收到了来自" + teacher.getUserName() + "的警告并扣除了" + punish + "分" + "(警告原因:" + reason + ")");
        } else {
            systemMessage.setMessage("收到了来自" + teacher.getUserName() + "的警告" + "(警告原因:" + reason + ")");
        }
        temporalMsgs.sendMessage(systemMessage);
        String msg = "success";
        return JSON.toJSONString(msg);
    }


    @RequestMapping("allWarns")
    public Map warnInfo() {
        //warnList=new ArrayList();

        List warnList = dao.selectAll();


        String msg = "success";
        Map map = new HashMap();
        map.put("msg", msg);
        map.put("warnList", warnList);
        return map;
    }


    @RequestMapping("delWarn")
    public String delWarn(int warnid) {
        //warnList=new ArrayList();
        String msg = "";
        if (warnid != 0) {
            Warn x = (Warn) dao.select(Warn.class, warnid);
            if (x != null) {
                dao.del(x);
                msg = "success";
            } else {
                System.out.println(warnid);
            }

        } else {
            msg = "error";
        }

        return JSON.toJSONString(msg);
    }


}
