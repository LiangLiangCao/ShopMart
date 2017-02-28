package edu.zju.cst.service;

import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstant;
import edu.zju.cst.dao.UserMapper;
import edu.zju.cst.exception.AuthException;
import edu.zju.cst.util.AuthUtils;
import edu.zju.cst.util.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * Created by Liang on 20/02/2017.
 */
@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper usrMapper;


    public int deleteByPrimaryKey(Long uid) {
        return usrMapper.deleteByPrimaryKey(uid);
    }

    public int insert(User record) {
        return usrMapper.insert(record);
    }

    public int insertSelective(User record) {
        return usrMapper.insertSelective(record);
    }

    public User selectByPrimaryKey(Long uid) {
        return usrMapper.selectByPrimaryKey(uid);
    }

    public int updateByPrimaryKeySelective(User record) {
        return usrMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(User record) {
        return usrMapper.updateByPrimaryKey(record);
    }

    /**
     * 管理员登陆
     *
     * @param password
     * @param request
     * @throws IOException
     */
    public void adminLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException {
        User usr = usrMapper.selectByPrimaryKey(Long.parseLong(name));
        if (usr == null) {
            throw new AuthException("username user does not exist.");
        }

        boolean isCustom = usr.getRole().trim().equals(SystemConstant.CUSTOM_KIND_USR);
        if (!isCustom) {
            throw new AuthException("not admin,please login by user page.");
        }

        String loginPassword = AuthUtils.getPassword(password);
        if (loginPassword.equals(usr.getPassword())) {

            HttpSession session = request.getSession();
            usr.setPassword("");
            String superAdmin=PropertyUtils.getValue(SystemConstant.SUPER_ADMIN);
            if (name.equals(superAdmin)) {
                //0:超级管理员
                usr.setRole(SystemConstant.SUPER_ADMIN_USR);
            } else {
                //1:普通用户
                usr.setRole(SystemConstant.ADMIN_KIND_USR);
            }
            session.setAttribute(SystemConstant.SESSION_ADMIN, usr);

        } else {
            throw new AuthException("password or username wrong!");
        }
    }

    /**
     * 用户登陆
     *
     * @param password
     * @param request
     * @throws IOException
     */
    public void usrLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException {
        User usr = usrMapper.selectByPrimaryKey(Long.parseLong(name));
        if (usr == null) {
            throw new AuthException("username user does not exist.");
        }
        boolean isCustom = usr.getRole().equals(SystemConstant.CUSTOM_KIND_USR);
        boolean isPassed = AuthUtils.getPassword(password).equals(usr.getPassword());

        if (isCustom && isPassed) {

            HttpSession session = request.getSession();
            usr.setPassword("");
            usr.setRole(SystemConstant.CUSTOM_KIND_USR);

            session.setAttribute(SystemConstant.SESSION_CUSTOM, usr);
        } else {
            throw new AuthException("password or username wrong!");
        }
    }

    public Object getAllListPage(int pageNum){
        return null;
    }
}
