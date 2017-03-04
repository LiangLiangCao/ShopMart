package edu.zju.cst.service;

import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.dao.UserMapper;
import edu.zju.cst.exception.AuthException;
import edu.zju.cst.util.AuthUtils;
import edu.zju.cst.util.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


/**
 * Created by Liang on 20/02/2017.
 */
@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper usrMapper;

    public int deleteByID(Long uid) {
        return usrMapper.deleteByPrimaryKey(uid);
    }

    public int addUser(String email, String password, String role) {
        User user = new User();
        user.setRole(role);
        user.setEmail(email.trim());
        user.setPassword(AuthUtils.getPassword(password));

        return usrMapper.insertSelective(user);
    }

    public User findByID(Long uid) {
        return usrMapper.selectByPrimaryKey(uid);
    }

    public User findByEmail(String email) {
        return usrMapper.selectByEmail(email);
    }

    public int updateByID(User record) {
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
        boolean isCustom = usr.getRole().trim().equals(SystemConstants.CUSTOM_KIND_USR);
        if (isCustom) {
            throw new AuthException("not admin,please login by user page.");
        }

        String loginPassword = AuthUtils.getPassword(password);
        if (loginPassword.equals(usr.getPassword())) {
            HttpSession session = request.getSession();
            usr.setPassword("");
            String superAdmin = PropertyUtils.getValue(SystemConstants.SUPER_ADMIN);
            if (name.equals(superAdmin)) {
                //0:超级管理员
                usr.setRole(SystemConstants.SUPER_ADMIN_USR);
            } else {
                //1:普通用户
                usr.setRole(SystemConstants.ADMIN_KIND_USR);
            }
            session.setAttribute(SystemConstants.SESSION_ADMIN, usr);
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
        boolean isCustom = usr.getRole().equals(SystemConstants.CUSTOM_KIND_USR);
        boolean isPassed = AuthUtils.getPassword(password).equals(usr.getPassword());

        if (isCustom && isPassed) {
            HttpSession session = request.getSession();
            usr.setPassword("");
            usr.setRole(SystemConstants.CUSTOM_KIND_USR);
            session.setAttribute(SystemConstants.SESSION_CUSTOM, usr);
        } else {
            throw new AuthException("password or username wrong!");
        }
    }

    public List<User> getAllListPage(int size, int pageNum) {
        int offset = (pageNum - 1) * size;
        List<User> users = usrMapper.selectByPageSize(size, offset);

        for (User item : users) {
            String role = item.getRole();
            if (role.trim().equals("1") || role.trim().equals("0")) {
                item.setRole("管理员");
            } else {
                item.setRole("普通用户");
            }
        }
        return users;
    }

    public int deleteUser(long uId) {
        return 0;
    }
}
