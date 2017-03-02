package edu.zju.cst.dao;

import edu.zju.cst.bean.ShopItem;
import org.springframework.stereotype.Repository;

@Repository
public interface ShopItemMapper {
    int deleteByPrimaryKey(Long shopId);

    int insert(ShopItem record);

    int insertSelective(ShopItem record);

    ShopItem selectByPrimaryKey(Long shopId);

    int updateByPrimaryKeySelective(ShopItem record);

    int updateByPrimaryKey(ShopItem record);
}