package edu.zju.cst.dao;

import edu.zju.cst.bean.Orderitem;

public interface OrderitemMapper {
    int deleteByPrimaryKey(Long itemId);

    int insert(Orderitem record);

    int insertSelective(Orderitem record);

    Orderitem selectByPrimaryKey(Long itemId);

    int updateByPrimaryKeySelective(Orderitem record);

    int updateByPrimaryKey(Orderitem record);
}