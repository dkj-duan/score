package cn.bdqn.contoller;

import cn.bdqn.domain.Integral;
import cn.bdqn.domain.Sum;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.IntegralService;
import cn.bdqn.service.SumService;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/integral/")
public class IntegralController {

    @Autowired
    private IntegralService integralService;

    @Autowired
    private UserService userService;

    @Autowired
    private SumService sumService;

    @RequestMapping("/open")
    public String openUiUserScore(ModelMap modelMap,Integer userId)throws Exception{
        try {
            modelMap.addAttribute("userId",userId);
            return "userScore";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误");
        }
    }

    @RequestMapping("/selectAll")
    @ResponseBody
    public List<Integral> selectAll(Integer userId)throws Exception{

        try {
            List<Integral> integrals = integralService.queryByUserId(userId);
            return integrals;
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误");
        }
    }

    @RequestMapping("/selectByTime")
    @ResponseBody()
    public List<Integral> selectByTime(String startTime,String endTime,Integer userId)throws Exception{
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            List<Integral> integrals = integralService.queryByTime(sdf.parse(startTime),sdf.parse(endTime),userId);
            return integrals;
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }

    @RequestMapping("/openAdd")
    public String openAddUserScore(Integer userId,ModelMap modelMap)throws Exception{

        try {
            //获得用户信息
            User user = userService.queryByPrimaryKey(userId);
            List<Sum> sums = sumService.queryByUserName(user.getUserName(),null);
            modelMap.addAttribute("user",user);
            modelMap.addAttribute("sums",sums);
            return "addUserScore";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }

    @RequestMapping("/add")
    public String save(Integral integral,User user,ModelMap modelMap)throws Exception{
        try {

            integral.setUser(user);
            integralService.insert(integral);

            //更新积分
            Sum sum = sumService.queryByUserId(user.getUserId());
            sum.setSumScore(sum.getSumScore()+integral.getScore());
            sum.setUser(user);
            sumService.updateByPrimaryKeySelective(sum);
            modelMap.addAttribute("userId",integral.getUser().getUserId());
            return "forward:/integral/open";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误·");
        }
    }
}
