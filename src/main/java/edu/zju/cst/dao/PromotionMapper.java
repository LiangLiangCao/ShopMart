package edu.zju.cst.dao;

import edu.zju.cst.bean.Promotion;

public interface PromotionMapper {
    int deleteByPrimaryKey(Long promoId);

    int insert(Promotion record);

    int insertSelective(Promotion record);

    Promotion selectByPrimaryKey(Long promoId);

    int updateByPrimaryKeySelective(Promotion record);

    int updateByPrimaryKey(Promotion record);
}