package edu.zju.cst.manage.service;

import edu.zju.cst.bean.User;

/**
 * Created by Liang on 20/02/2017.
 */
public interface IUserService {
    public void insertSelective(User record);
    public void insert(User record);

    public User selectById(Integer id);
}
