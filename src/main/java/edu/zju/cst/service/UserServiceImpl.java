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
     * 登陆
     *
     * @param password
     * @param request
     * @throws IOException
     */
    public void usrLogin(String name, String password, HttpServletRequest request) throws AuthException, IOException {
        User usr = usrMapper.selectByPrimaryKey(Long.parseLong(name));
        if (usr == null) {
            throw new AuthException("邮箱或密码错误");
        }
        String loginPassword = AuthUtils.getPassword(password);
        if (loginPassword.equals(usr.getPassword())) {
            HttpSession session = request.getSession();
            usr.setPassword("");
            if (name.equals(PropertyUtils.getValue(SystemConstant.SUPER_ADMIN))) {
                //0:超级管理员
                usr.setRole("0");
            } else {
                //1:普通用户
                usr.setRole("1");
            }
            session.setAttribute(SystemConstant.SESSION_ADMIN, usr);
        } else {
            throw new AuthException("邮箱或密码错误");
        }
    }
}
