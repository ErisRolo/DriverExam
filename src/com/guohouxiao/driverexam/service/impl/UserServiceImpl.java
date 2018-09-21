package com.guohouxiao.driverexam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.guohouxiao.driverexam.service.UserService;
import org.springframework.stereotype.Service;

import com.guohouxiao.driverexam.mapper.UserMapper;
import com.guohouxiao.driverexam.model.User;
import com.guohouxiao.driverexam.model.UserExample;

/**
 * 普通用户
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper mapper;

    @Override
    public User login(String username, String password) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andPasswordEqualTo(password);
        List<User> list = mapper.selectByExample(example);
        return list != null && list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<User> getUserAll() {
        UserExample example = new UserExample();
        example.setOrderByClause("create_time DESC");
        return mapper.selectByExample(example);
    }

    @Override
    public User getUser(String id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public void addUser(User user) {
        mapper.insert(user);
    }

    @Override
    public void deleteUser(String id) {
        mapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateUser(User user) {
        mapper.updateByPrimaryKey(user);
    }

    @Override
    public void updateResetPassword(User user) {
        user.setPassword("123456");
        mapper.updateByPrimaryKey(user);
    }

    @Override
    public boolean checkUsername(String username) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<User> list = mapper.selectByExample(example);
        return list != null && list.size() > 0 ? true : false;
    }

    @Override
    public boolean updatePassword(User user) {
        return mapper.updateByPrimaryKey(user) > 0 ? true : false;
    }

}
