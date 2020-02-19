package cn.bdqn.mapper;

import cn.bdqn.domain.User;

//用户接口
public interface UserMapper {


    //根据用户id删除
    void deleteByPrimaryKey(Integer userId);

    //添加用户
    void insert(User record);

    void insertSelective(User record);

    //根据用户id查询
    User selectByPrimaryKey(Integer userId);

    //选择性更新
    void updateByPrimaryKeySelective(User record);

    //更新全部
    void updateByPrimaryKey(User record);
}