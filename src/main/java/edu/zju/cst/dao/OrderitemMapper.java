package edu.zju.cst.dao;

import edu.zju.cst.bean.Orderitem;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderitemMapper {
    int deleteByPrimaryKey(Long itemId);

    int insert(Orderitem record);

    int insertSelective(Orderitem record);

    Orderitem selectByPrimaryKey(Long itemId);

    int updateByPrimaryKeySelective(Orderitem record);

    int updateByPrimaryKey(Orderitem record);

    List<Orderitem> selectByOrder(@Param("orderId") Long orderId);
}