package edu.zju.cst.dao;

import edu.zju.cst.bean.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
    int deleteByPrimaryKey(String adminName);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(String adminName);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}