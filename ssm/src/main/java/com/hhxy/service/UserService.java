package com.hhxy.service;

import com.hhxy.pojo.User;

public interface UserService {
    boolean register(User user);

    // 登录：返回用户对象（null表示失败）
    User login(String username, String password);
}
