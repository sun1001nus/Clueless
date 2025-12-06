package com.hhxy.service;

import com.github.pagehelper.PageInfo;
import com.hhxy.pojo.Item;

import java.util.List;

public interface ItemService {
    public List<Item> queryItemList()throws Exception;
    public void addItem(Item item) throws Exception;
    public void updateItem(Item item) throws Exception;
    public Item queryItemById(int id) throws Exception;
    public void deleteItem(int id) throws Exception;
    public List<Item> selectItemsByKeyword(String keyword) throws Exception;
    //分页查询全部商品
    PageInfo<Item> getAllItemsByPage(int pageNum, int pageSize);
    //分页模糊查询商品
    PageInfo<Item> searchItemsByPage(String keyword, int pageNum, int pageSize);
}
