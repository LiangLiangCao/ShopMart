package edu.zju.cst.dao;

import edu.zju.cst.bean.Promotion;
import org.springframework.stereotype.Repository;

@Repository
public interface PromotionMapper {
    int deleteByPrimaryKey(Long promotionId);

    int insert(Promotion record);

    int insertSelective(Promotion record);

    Promotion selectByPrimaryKey(Long promotionId);

    int updateByPrimaryKeySelective(Promotion record);

    int updateByPrimaryKey(Promotion record);
}