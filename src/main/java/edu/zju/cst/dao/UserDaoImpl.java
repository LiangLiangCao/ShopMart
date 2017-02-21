package edu.zju.cst.dao;

import edu.zju.cst.bean.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

/**
 * Created by Liang on 20/02/2017.
 */
public class UserDaoImpl implements UserDao {
    private SqlSessionFactory sessionFactory;
    private SqlSession session;

    public UserDaoImpl() {
        String resource = "conf.xml";

        try {
            Reader reader = Resources.getResourceAsReader(resource);
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
            session = sessionFactory.openSession();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public int deleteById(Integer id) {
        return 0;
    }

    public void insert(User record) {
        String statement = "userMapper.insert";
        session.insert(statement, record);
        session.commit();

    }

    public void insertSelective(User record) {
        String statement = "UserDao.insertSelective";
        session.insert(statement, record);
        session.commit();
    }

    public User selectById(Integer id) {
        String statement = "UserDao.selectById";
        User usr = (User) session.selectOne(statement, 1);
        return usr;
    }

    public int updateByIdSelective(User record) {
        return 0;
    }

    public int updateById(User record) {
        return 0;
    }

}
