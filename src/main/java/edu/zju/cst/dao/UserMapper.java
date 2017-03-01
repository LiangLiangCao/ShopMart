package edu.zju.cst.dao;

import edu.zju.cst.bean.User;
import org.springframework.stereotype.Repository;



@Repository
public interface UserMapper {

    int deleteByPrimaryKey(Long uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long uid);

    User selectByEmail(String email);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}