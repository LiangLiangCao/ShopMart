package edu.zju.cst.dao;

import edu.zju.cst.bean.Category;
import edu.zju.cst.bean.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CategoryMapper {
    int deleteByPrimaryKey(Long categoryId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Long categoryId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> selectByPageSize(@Param("num") int num, @Param("offset")int offset);

    int deleteByUpdate(Long id);

    int countTotal();
}