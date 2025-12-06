package com.hhxy.mapper;

import com.hhxy.pojo.User;

public interface UserMapper {
    // 注册：插入用户
    int insertUser(User user);

    // 登录：根据用户名查询用户
    User selectUserByUsername(String username);
}
