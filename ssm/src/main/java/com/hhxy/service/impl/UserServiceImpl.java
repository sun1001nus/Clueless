package com.hhxy.service.impl;

import com.hhxy.mapper.UserMapper;
import com.hhxy.pojo.User;
import com.hhxy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    // 注册：先判断用户名是否存在，再插入
    @Override
    public boolean register(User user) {
        User existUser = userMapper.selectUserByUsername(user.getUsername());
        if (existUser != null) {
            return false; // 用户名已存在
        }
        // （可选：密码加密，比如用MD5）
        // user.setPassword(MD5Util.encode(user.getPassword()));
        return userMapper.insertUser(user) > 0;
    }


    // 登录：查用户+对比密码
    @Override
    public User login(String username, String password) {
        User user = userMapper.selectUserByUsername(username);
        if (user != null && user.getPassword().equals(password)) { // 若加密则需要解密/加密后对比
            return user;
        }
        return null;
    }
}
