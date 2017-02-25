package edu.zju.cst.dao;

import edu.zju.cst.bean.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    int deleteById(Integer id);

    void insert(User record);

    void insertSelective(User record);

    User selectById(Integer id);

    int updateByIdSelective(User record);

    int updateById(User record);
}