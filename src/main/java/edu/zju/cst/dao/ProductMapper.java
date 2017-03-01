package edu.zju.cst.dao;

import edu.zju.cst.bean.Product;
import edu.zju.cst.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductMapper {
    int deleteByPrimaryKey(Long proId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Long proId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> selectByPageSize(@Param("num") int num, @Param("offset")int offset);
}