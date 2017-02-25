package edu.zju.cst.dao;

import edu.zju.cst.bean.Product;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductMapper {
    int deleteByPrimaryKey(Long proId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Long proId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}