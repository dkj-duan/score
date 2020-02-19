package cn.bdqn.domain;

import org.springframework.stereotype.Component;

import java.util.Date;

//用户表
@Component
public class User {
    //用户id
    private Integer userId;

    //用户创建时间
    private String userName;

    //用户创建时间
    private Date createDate;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", createDate=" + createDate +
                '}';
    }
}