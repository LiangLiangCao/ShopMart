package edu.zju.cst.dao;

import edu.zju.cst.bean.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductMapper {
    int deleteByPrimaryKey(Long productId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Long productId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> selectByPageSize(@Param("num") int num, @Param("offset")int offset);

    int deleteByUpdate(Long userId);

    int countTotal(@Param("catId")Integer catId);

    List<Product> selectByCategory(@Param("num") int num,
                                   @Param("offset")int offset,
                                   @Param("catId")int catId);

}