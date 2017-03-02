package edu.zju.cst.dao;

import edu.zju.cst.bean.Orders;
import org.springframework.stereotype.Repository;

@Repository
public interface OrdersMapper {
    int deleteByPrimaryKey(Long ordrId);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Long ordrId);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
}