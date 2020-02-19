package cn.bdqn.domain;

import org.springframework.stereotype.Component;

@Component
public class Sum {
    //总积分表id
    private Integer sumId;

    //用户id
    private User user;

    //用户总积分
    private Integer sumScore;

    public Integer getSumId() {
        return sumId;
    }

    public void setSumId(Integer sumId) {
        this.sumId = sumId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getSumScore() {
        return sumScore;
    }

    public void setSumScore(Integer sumScore) {
        this.sumScore = sumScore;
    }

    @Override
    public String toString() {
        return "Sum{" +
                "sumId=" + sumId +
                ", user=" + user +
                ", sumScore=" + sumScore +
                '}';
    }
}