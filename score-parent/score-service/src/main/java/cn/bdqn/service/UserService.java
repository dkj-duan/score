package cn.bdqn.service;

import cn.bdqn.domain.User;

public interface UserService {

    //根据用户id删除
    void deleteByPrimaryKey(Integer userId);

    //添加用户
    void insert(User record);

    void insertSelective(User record);

    //根据用户id查询
    User queryByPrimaryKey(Integer userId);

    //选择性更新
    void updateByPrimaryKeySelective(User record);

    //更新全部
    void updateByPrimaryKey(User record);

}
