package com.hhxy.mapper;


import com.hhxy.pojo.Item;

import java.util.List;

public interface ItemMapper {

// 新增商品信息
// 更新商品信息
// 根据id查询商品信息
// 删除商品信息
// 模糊查询商品（参数为查询关键词）
   public List<Item> queryItemList() throws Exception;
   public void addItem(Item item) throws Exception;
   public void updateItem(Item item) throws Exception;
   public Item queryItemById(int id) throws Exception;
   public void deleteItem(int id) throws Exception;
   public List<Item> selectItemsByKeyword(String keyword)throws Exception;

}
