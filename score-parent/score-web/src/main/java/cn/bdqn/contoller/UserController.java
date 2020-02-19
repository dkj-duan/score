package cn.bdqn.contoller;

import cn.bdqn.domain.Sum;
import cn.bdqn.domain.User;
import cn.bdqn.exception.MyException;
import cn.bdqn.service.SumService;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private SumService sumService;

    @Autowired
    private UserService userService;


    @RequestMapping("/save")
    public String saveUser(User user)throws Exception{

        try {
            //添加时间
            user.setCreateDate(new Date());
            //创建用户
            userService.insert(user);

            Sum sum = new Sum();
            sum.setUser(user);
            sum.setSumScore(0);
            //添加总积分表
            sumService.insert(sum);
            return "redirect:/index.jsp";
        }catch (Exception e){
            e.printStackTrace();
            throw new MyException("网络错误~");
        }
    }
}
