package paperandquestion.controller;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.*;
import paperandquestion.model.Paper;
import paperandquestion.services.PaperService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController("paperController")
//@Scope("prototype")
public class PaperController {
//
@Autowired
    private PaperService paperService;

    public PaperService getPaperService() {
        return paperService;
    }

    public void setPaperService(PaperService paperService) {
        this.paperService = paperService;
    }

    @RequestMapping(value = "tea/findAllPaper",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findAllPaper(){

        List<Paper> paperList= paperService.findAllPaper();
        System.out.println(new Gson().toJson(paperList));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("paperList", paperList);
       // return map;
        return new Gson().toJson(map);
    }

    @RequestMapping(value = "tea/updatePaper",produces ="text/html;charset=UTF-8" )
    @ResponseBody
    public String updatePaper(@RequestParam("pcontext") String pcontexte , @RequestParam("ptime") String ptime, @RequestParam("pid") String pid){
        Paper paper = paperService.getPaper(Integer.parseInt(pid));
        paper.setPcontext(pcontexte);
        paper.setPtime(ptime);
        paperService.updatePaper(paper);
        return "success";
    }

    @RequestMapping(value = "tea/deletePaper",produces ="text/html;charset=UTF-8" )
    @ResponseBody
    public String deletePaper(@RequestBody String pid){

        return "success";
    }
}
