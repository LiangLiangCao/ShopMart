package edu.zju.cst.dao;

import edu.zju.cst.bean.Supplier;

public interface SupplierMapper {
    int deleteByPrimaryKey(Long suplrId);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Long suplrId);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
}