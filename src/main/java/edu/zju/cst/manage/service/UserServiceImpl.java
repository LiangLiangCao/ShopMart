package edu.zju.cst.manage.service;

import edu.zju.cst.bean.User;
import edu.zju.cst.dao.UserDao;
import edu.zju.cst.dao.UserDaoImpl;

/**
 * Created by Liang on 20/02/2017.
 */
public class UserServiceImpl implements IUserService {
    private UserDao usrDao;

    public UserServiceImpl() {
        usrDao = new UserDaoImpl();
    }

    public void insertSelective(User record) {
        usrDao.insertSelective(record);
    }

    public void insert(User record) {

        usrDao.insert(record);
    }

    public User selectById(Integer id) {
        return usrDao.selectById(id);
    }
}
