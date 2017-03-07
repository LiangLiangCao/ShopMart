package edu.zju.cst.service;

import edu.zju.cst.bean.User;
import edu.zju.cst.exception.AuthException;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by Liang on 20/02/2017.
 */
public interface IUserService {
    int deleteByID(Long uid);

    User findByID(Long uid);

    int updateByID(User record);

    int addUser(User user);

    List<User> getAllListPage(int size, int pageNum);

    User findByEmail(String email);

    void usrLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException;

    void adminLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException;

    int getCount();
}
