package cn.bdqn.service.impl;

import cn.bdqn.domain.Integral;
import cn.bdqn.domain.Sum;
import cn.bdqn.mapper.SumMapper;
import cn.bdqn.service.SumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("sumService")
public class SumServiceImpl implements SumService {

    @Autowired
    private SumMapper sumMapper;

    @Override
    public void deleteByPrimaryKey(Integer sumId) {

        //根据主键id删除
        sumMapper.deleteByPrimaryKey(sumId);
    }

    @Override
    public void insert(Sum record) {

        //创建总积分表
        sumMapper.insert(record);
    }

    @Override
    public void insertSelective(Sum record) {

        //创建总积分表
        sumMapper.insertSelective(record);
    }

    @Override
    public Sum queryByPrimaryKey(Integer sumId) {
        //根据主键id查询
        return sumMapper.selectByPrimaryKey(sumId);
    }

    @Override
    public void updateByPrimaryKeySelective(Sum record) {

        //更新总积分
        sumMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKey(Sum record) {

        //更新总积分
        sumMapper.updateByPrimaryKey(record);
    }

    @Override
    public Sum queryByUserId(Integer UserId) {
        return sumMapper.selectByUserId(UserId);
    }

    @Override
    public List<Sum> queryByUserName(String userName,Integer score) {
        //根据姓名模糊查询
        return sumMapper.selectByUserName(userName,score);
    }
}
