package com.hhxy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hhxy.mapper.ItemMapper;
import com.hhxy.pojo.Item;

import com.hhxy.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {
    @Autowired
    private ItemMapper itemMapper;
    @Override
    public List<Item> queryItemList() throws Exception {
        return itemMapper.queryItemList();
    }

    @Override
    public void addItem(Item item) throws Exception {
        itemMapper.addItem(item);
    }

    @Override
    public void updateItem(Item item) throws Exception {
        itemMapper.updateItem(item);
    }

    @Override
    public Item queryItemById(int id) throws Exception {
        return itemMapper.queryItemById(id);
    }

    @Override
    public void deleteItem(int id) throws Exception {
        itemMapper.deleteItem(id);
    }

    // 模糊查询商品
    @Override
    public List<Item> selectItemsByKeyword(String keyword) throws Exception {
        // 若关键词为空，返回所有商品
        if (keyword == null || keyword.trim().isEmpty()) {
            return itemMapper.queryItemList();
        }
        return itemMapper.selectItemsByKeyword(keyword);
    }

    // 分页查询全部
    @Override
    public PageInfo<Item> getAllItemsByPage(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Item> itemList = null;
        try {
            itemList = itemMapper.queryItemList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return new PageInfo<>(itemList);
    }

    // 分页模糊查询
    @Override
    public PageInfo<Item> searchItemsByPage(String keyword, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Item> itemList;
        if (keyword == null || keyword.trim().isEmpty()) {
            try {
                itemList = itemMapper.queryItemList();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                itemList = itemMapper.selectItemsByKeyword(keyword);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        return new PageInfo<>(itemList);
    }
}

