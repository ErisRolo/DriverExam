package com.guohouxiao.driverexam.service;

import java.util.List;

import com.guohouxiao.driverexam.model.User;

/**
 * 普通用户
 */
public interface UserService {

    public User login(String username, String password);

    public List<User> getUserAll();

    public User getUser(String id);

    public void addUser(User user);

    public void deleteUser(String id);

    public void updateUser(User user);

    public void updateResetPassword(User user);

    public boolean checkUsername(String username);

    public boolean updatePassword(User user);

}
