package edu.zju.cst.dao;

import edu.zju.cst.bean.Category;
import org.springframework.stereotype.Repository;


@Repository
public interface CategoryMapper {
    int deleteByPrimaryKey(Long categoryId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Long categoryId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}