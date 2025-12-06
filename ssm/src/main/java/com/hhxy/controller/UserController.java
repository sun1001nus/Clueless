package com.hhxy.controller;

import com.hhxy.pojo.User;
import com.hhxy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    // 跳转到注册页
    @RequestMapping("/toRegister")
    public String toRegister() {
        return "register"; // 解析为/WEB-INF/jsp/register.jsp
    }

    // 注册逻辑：成功→带提示回注册页（页面自动跳登录）；失败→回显错误
    @RequestMapping("/register")
    public String register(User user, Model model) {
        boolean success = userService.register(user);
        if (success) {
            // 注册成功：添加成功提示，返回注册页（页面会自动跳登录）
            model.addAttribute("successMsg", "注册成功！自动跳转到登录页...");
            return "register";
        } else {
            // 注册失败：回显错误提示
            model.addAttribute("msg", "用户名已存在！");
            return "register";
        }
    }

    // 跳转到登录页面
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login"; // 对应webapp下的login.jsp
    }

    // 登录请求
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session, Model model) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("loginUser", user); // 登录态存入Session
            return "main"; // 登录成功跳首页
        } else {
            model.addAttribute("msg", "用户名或密码错误！");
            return "login"; // 登录失败回显提示
        }
    }

    // 退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 销毁Session
        return "redirect:/user/toLogin";
    }

    @GetMapping("/manage")
    public String manage(){
        return "mainmanage";
    }
    @GetMapping("/hong")
    public String hong(){
        return "mainhong";
    }
}
