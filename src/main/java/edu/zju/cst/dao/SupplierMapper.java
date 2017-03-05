package edu.zju.cst.dao;

import edu.zju.cst.bean.Supplier;
import org.springframework.stereotype.Repository;

@Repository
public interface SupplierMapper {
    int deleteByPrimaryKey(Long supplierId);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Long supplierId);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
    int deleteByUpdate(Long userId);
}