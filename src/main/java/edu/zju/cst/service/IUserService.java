package edu.zju.cst.service;

import edu.zju.cst.bean.User;
import edu.zju.cst.exception.AuthException;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by Liang on 20/02/2017.
 */
public interface IUserService {
    int deleteByPrimaryKey(Long uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    public void usrLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException;

    Object getAllListPage(int pageNum);
}
