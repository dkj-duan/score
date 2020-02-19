package cn.bdqn.service.impl;

import cn.bdqn.domain.Integral;
import cn.bdqn.mapper.IntegralMapper;
import cn.bdqn.service.IntegralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("integralService")
public class IntegralServiceImpl implements IntegralService {

    @Autowired
    private IntegralMapper integralMapper;

    @Override
    public void deleteByPrimaryKey(Integer id) {
        //根据主键删除积分明细
        integralMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Integral record) {

        //新增积分明细记录
        integralMapper.insert(record);
    }

    @Override
    public void insertSelective(Integral record) {

        //新增
        integralMapper.insertSelective(record);
    }

    @Override
    public Integral queryByPrimaryKey(Integer id) {
        //根据主键id查询积分明细记录
        return integralMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKeySelective(Integral record) {

        //更新积分记录
        integralMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKey(Integral record) {

        //更新
        integralMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Integral> queryByUserId(Integer UserId) {
        //根据用户id查询积分记录信息
        return integralMapper.selectByUserId(UserId);
    }

    @Override
    public List<Integral> queryByTime(Date startTime, Date endTime, Integer userId) {
        //根据某个时间段查询用户信息
        return integralMapper.selectByTime(startTime,endTime,userId);
    }
}
