package cn.bdqn.contoller;

import cn.bdqn.domain.Sum;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.SumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/sum/")
public class SumController {

    @Autowired
    private SumService sumService;

    @RequestMapping("/selectByUserName")
    @ResponseBody
    public List<Sum> selectByUserName(Integer judge,String select)throws Exception{

        String userName = null;
        Integer score = null;
        try {
            if (judge != null){
                if (judge==1){
                    userName = select.toString();
                }else if (judge==2){
                    if(select!=null&&select!=""){
                        score = Integer.parseInt(select);
                    }
                }
            }
            //根据姓名模糊查询
            List<Sum> sums = sumService.queryByUserName(userName,score);
            return sums;
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }


}
