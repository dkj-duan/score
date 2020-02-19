package cn.bdqn.exception;


/**
 * 自定义异常类
 */
public class MyException extends Exception {

    private String message;

    public MyException(String message){
        this.message = message;
    }
    @Override
    public String getMessage() {
        return this.message;
    }
}
