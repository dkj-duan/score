package cn.bdqn.domain;

import org.springframework.stereotype.Component;

import java.util.Date;

//积分榜
@Component
public class Integral {

    //积分id
    private Integer id;

    //用户
    private User user;

    //每日分数
    private Integer score;

    //每日添加时间
    private Date createDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Integral{" +
                "id=" + id +
                ", user=" + user +
                ", score=" + score +
                ", createDate=" + createDate +
                '}';
    }
}