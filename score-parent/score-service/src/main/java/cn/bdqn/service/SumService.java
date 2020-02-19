package cn.bdqn.service;

import cn.bdqn.domain.Integral;
import cn.bdqn.domain.Sum;

import java.util.List;

public interface SumService {

    //根据id删除
    void deleteByPrimaryKey(Integer sumId);

    //添加
    void insert(Sum record);

    void insertSelective(Sum record);

    //根据id查询
    Sum queryByPrimaryKey(Integer sumId);

    //选择性更新
    void updateByPrimaryKeySelective(Sum record);

    //更新全部
    void updateByPrimaryKey(Sum record);

    //根据用户姓名模糊查询
    public List<Sum> queryByUserName(String userName,Integer score);

    //根据用户id查询
    public Sum queryByUserId(Integer UserId);

}
