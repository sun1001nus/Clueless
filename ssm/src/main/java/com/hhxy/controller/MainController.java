package com.hhxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Main")
public class MainController {
    @GetMapping("/mainindex")
    public String mainindex(){
        return "mainindex";
    }

    @GetMapping("/home")
    public String mainhome(){
        return "mainhome";
    }
}
