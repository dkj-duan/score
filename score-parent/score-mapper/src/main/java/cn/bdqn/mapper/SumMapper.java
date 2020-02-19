package cn.bdqn.mapper;

import cn.bdqn.domain.Integral;
import cn.bdqn.domain.Sum;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SumMapper {

    //根据id删除
    void deleteByPrimaryKey(Integer sumId);

    //添加
    void insert(Sum record);

    void insertSelective(Sum record);

    //根据id查询
    Sum selectByPrimaryKey(Integer sumId);

    //选择性更新
    void updateByPrimaryKeySelective(Sum record);

    //更新全部
    void updateByPrimaryKey(Sum record);

    //根据用户姓名模糊查询
    public List<Sum> selectByUserName(@Param("userName")String userName,@Param("score") Integer score);

    //根据用户id查询
    public Sum selectByUserId(Integer UserId);

}