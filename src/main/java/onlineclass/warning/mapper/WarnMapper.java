package onlineclass.warning.mapper;

import onlineclass.warning.model.Warn;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


public interface WarnMapper extends Mapper<Warn> {
    List findStuWarning(int sid);

    List findAllWarn();

    void addWarn(Warn warn);
}
