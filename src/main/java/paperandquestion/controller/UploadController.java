package paperandquestion.controller;

import core.utils.JaveUsePython;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Controller
public class UploadController {
    @RequestMapping(value = "tea/uploadFile.do", produces = "text/html;charset=utf-8")
    public @ResponseBody  String upload(MultipartFile file, HttpServletRequest request) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());

        // uploads文件夹位置
        String rootPath = request.getSession().getServletContext().getRealPath("resource/uploads/");
        // 原始名称
        String originalFileName = file.getOriginalFilename();
        // 新文件名
        String newFileName = "a" + originalFileName.substring(originalFileName.lastIndexOf("."));
        // 创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH)+1));

        // 新文件
        File newFile = new File(rootPath + newFileName);
        // 判断目标文件所在目录是否存在
        if( !newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        /*if( !newFile.exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.delete();
        }*/
        System.out.println(newFile);
        // 将内存中的数据写入磁盘
        file.transferTo(newFile);
        System.out.println("2222222222" + request.getSession().getServletContext().getRealPath("web"));

        System.out.println("1111111111111111111111" + request.getSession().getServletContext().getRealPath("assert"));
        JaveUsePython.runPy(request.getSession().getServletContext().getRealPath("assert") + "\\py\\word.py");

        String fileUrl = date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH)+1) + "/" + newFileName;
        return "<script>alert(\"上传成功\");setInterval(function(){location.href=\"\\ppaper\"},100)</script>";
    }
}
