package cn.bdqn.mapper;

import cn.bdqn.domain.Integral;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

//积分表mapper接口
public interface IntegralMapper {

    //根基id删除
    void deleteByPrimaryKey(Integer id);

    //添加积分
    void insert(Integral record);

    //选择性添加
    void insertSelective(Integral record);

    //根基id查询
    Integral selectByPrimaryKey(Integer id);

    //选择更新
    void updateByPrimaryKeySelective(Integral record);

    //更新全部
    void updateByPrimaryKey(Integral record);

    //根据用户id查询
    public List<Integral> selectByUserId(Integer UserId);

    //根据时间段查询某个用户的积分明细
    public List<Integral> selectByTime(@Param("startTime") Date startTime, @Param("endTime")Date endTime,@Param("userId")Integer userId);
}