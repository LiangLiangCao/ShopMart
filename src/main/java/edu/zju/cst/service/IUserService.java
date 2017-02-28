package edu.zju.cst.service;

import edu.zju.cst.bean.User;
import edu.zju.cst.exception.AuthException;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by Liang on 20/02/2017.
 */
public interface IUserService {
    int deleteByID(Long uid);

    int addUser(User record);

    int addUserSelective(User record);

    User findByID(Long uid);

    int updateByIDSelective(User record);

    int updateByID(User record);

     void usrLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException;

    Object getAllListPage(int pageNum);
     User findByEmail(String email);
}
