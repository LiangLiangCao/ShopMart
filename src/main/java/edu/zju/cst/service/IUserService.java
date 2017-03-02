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

    User findByID(Long uid);

    int updateByID(User record);

    int addUser(String email, String password, String role);

    Object getAllListPage(int pageNum);

    User findByEmail(String email);

    public void usrLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException;

    public void adminLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException;

}
