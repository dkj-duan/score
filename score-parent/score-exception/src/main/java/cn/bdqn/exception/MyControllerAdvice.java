package cn.bdqn.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

/**
 * 异常处理类
 */
@ControllerAdvice
public class MyControllerAdvice {

    public ModelAndView myExceptionMessage(Exception e){

        MyException myException = null;
        if (e instanceof MyException){
            myException = (MyException) e;
        }else {
            myException = new MyException("网络错误~");
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message",myException.getMessage());
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
