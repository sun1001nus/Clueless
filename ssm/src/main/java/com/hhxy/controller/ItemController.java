package com.hhxy.controller;


import com.github.pagehelper.PageInfo;
import com.hhxy.pojo.Item;
import com.hhxy.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Item")
public class ItemController {
    @Autowired
    private ItemService itemService;

    @GetMapping("/querylist")
    public String List( @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,Model model){
        try {
            PageInfo<Item> pageInfo = itemService.getAllItemsByPage(pageNum, pageSize);
            model.addAttribute("pageInfo", pageInfo); // 分页数据传给页面
            model.addAttribute("keyword", ""); // 关键词为空（标记是全部商品）
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "ItemList";
    }


    // 模糊查询（带关键词）
    @RequestMapping("/search")
    public String searchItems(@RequestParam("keyword") String keyword,@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize, Model model) {
        // 1. 关键词去空格，判空
        String trimKeyword = keyword.trim();
        PageInfo<Item> pageInfo;
        if (trimKeyword.isEmpty()) {
            pageInfo = itemService.getAllItemsByPage(pageNum, pageSize);
            model.addAttribute("searchMsg", "请输入搜索关键词！");
            model.addAttribute("keyword", "");// 空关键词 → 隐藏返回按钮
        }else {
                pageInfo = itemService.searchItemsByPage(trimKeyword, pageNum, pageSize);
                if (pageInfo.getList().isEmpty()) {
                    model.addAttribute("searchMsg", "未找到包含【" + trimKeyword + "】的商品！");
                }
            model.addAttribute("keyword", trimKeyword); // 非空关键词 → 显示返回按钮
            }

        model.addAttribute("pageInfo", pageInfo); // 分页数据
        model.addAttribute("keyword", trimKeyword); // 回显关键词
        return "ItemList"; // 仍返回原有页面
    }


    @GetMapping("/add")
    /*这个控制类的作用：
     *  技术上：WEB-INF下的 JSP 无法被前端直接访问，必须走 Controller 转发；
     *  架构上：遵循 MVC 职责分离，同时支持权限、数据预加载等扩展需求。
     */
    public String add(){
        return "AddList";
    }

    @RequestMapping("/AddList")
    public String addItem(Item item){
        try {
            itemService.addItem(item);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/Item/querylist";
    }

    @RequestMapping("/Up")
    public String Update(Integer id,Model model){
        try {
            Item item = itemService.queryItemById(id);
            model.addAttribute("item",item);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "UpdateList";
    }

    @RequestMapping("/UpList")
    public String upItem(Item item){
        try {
            itemService.updateItem(item);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/Item/querylist";
    }

    @RequestMapping("/DeleList")
    public String deleList(int id){
        try {
            itemService.deleteItem(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/Item/querylist";
    }


    /*
     *   商品管理系统
     * 任务1：美化页面√
     * 任务2：完善用户注册登录功能√
     * 任务3：商品列表添加模糊查询√
     * 任务4：商品列表实现分页功能√
     * 任务5：添加角色权限或事务功能
     * 任务6：导航栏添加其他功能模块√
     * */

}
