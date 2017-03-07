package edu.zju.cst.dao;

import edu.zju.cst.bean.Orderitem;
import edu.zju.cst.bean.Orders;
import edu.zju.cst.bean.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersMapper {
    int deleteByPrimaryKey(Long ordrId);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Long ordrId);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);

    List<Orders> selectByPageSize(@Param("num") int num, @Param("offset")int offset);

    int deleteByUpdate(Long userId);

    int countTotal();

    List<Orders> selectByUser(@Param("uid") Long uid,@Param("type")Integer type,@Param("keyword")String keyword);

}