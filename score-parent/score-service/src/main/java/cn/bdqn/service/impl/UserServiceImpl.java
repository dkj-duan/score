package cn.bdqn.service.impl;

import cn.bdqn.domain.User;
import cn.bdqn.mapper.UserMapper;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void deleteByPrimaryKey(Integer userId) {

        //根据主键id删除用户
        userMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public void insert(User record) {

        //添加用户
        userMapper.insert(record);
    }

    @Override
    public void insertSelective(User record) {

        userMapper.insertSelective(record);
    }

    @Override
    public User queryByPrimaryKey(Integer userId) {
        //根据主键id查询用户信息
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public void updateByPrimaryKeySelective(User record) {

        //更新用户信息
        userMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKey(User record) {

        //更新用户信息
        userMapper.updateByPrimaryKey(record);
    }
}
