package edu.zju.cst.dao;

import edu.zju.cst.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> selectByPageSize(@Param("num") int num, @Param("offset") int offset);

    User selectByEmail(String email);
    int deleteByUpdate(Long userId);

}