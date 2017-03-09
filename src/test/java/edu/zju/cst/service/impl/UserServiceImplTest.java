package edu.zju.cst.service.impl;

import edu.zju.cst.bean.User;
import edu.zju.cst.dao.UserMapper;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import static org.mockito.Matchers.any;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.when;

/**
 * UserServiceImpl Tester.
 *
 * @author <Authors name>
 * @version 1.0
 */
public class UserServiceImplTest {

    @InjectMocks
    private UserServiceImpl userService;

    @Mock
    private UserMapper userMapper;


    @Before
    public void before() throws Exception {
        //初始化对象的注解
        userService = new UserServiceImpl();
        MockitoAnnotations.initMocks(this);
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: deleteByID(Long uid)
     */
    @Test
    public void testDeleteByID() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: addUser(User user)
     */
    @Test
    public void testAddUser() throws Exception {

        doAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("testAddUser");
                return null;
            }
        }).when(userMapper).insertSelective(any(User.class));
        User user = new User();
        user.setUserId(new Long(1));
        user.setPassword("1");
        userService.addUser(user);
    }

    /**
     * Method: findByID(Long uid)
     */
    @Test
    public void testFindByID() throws Exception {

        Long id = new Long(1);
        when(userMapper.selectByPrimaryKey(id)).thenAnswer(
                new Answer<Void>() {
                    public Void answer(InvocationOnMock invocation) throws Throwable {
                        System.out.println("testFindByID");
                        return null;
                    }
                }
        );
        userService.findByID(id);

    }

    /**
     * Method: findByEmail(String email)
     */
    @Test
    public void testFindByEmail() throws Exception {
        String email="6325653@qq.com";
        when(userMapper.selectByEmail(email)).thenAnswer(
                new Answer<Void>() {
                    public Void answer(InvocationOnMock invocation) throws Throwable {
                        System.out.println("find users");
                        return null;
                    }
                }
        );
        userService.findByEmail(email);
    }

    /**
     * Method: updateByID(User record)
     */
    @Test
    public void testUpdateByID() throws Exception {

        User user=new User();
        user.setUserId(new Long(1));
        user.setPassword("1");
        when(userMapper.updateByPrimaryKey(user)).thenAnswer(
                new Answer<Void>() {
                    public Void answer(InvocationOnMock invocation) throws Throwable {
                        System.out.println("testUpdateByID");
                        return null;
                    }
                }
        );
        userService.updateByID(user);
    }

    /**
     * Method: adminLogin(String name, String password, HttpServletRequest request)
     */
    @Test
    public void testAdminLogin() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: usrLogin(String name, String password, HttpServletRequest request)
     */
    @Test
    public void testUsrLogin() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getAllListPage(int num, int pageNum)
     */
    @Test
    public void testGetAllListPage() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getCount()
     */
    @Test
    public void testGetCount() throws Exception {
//TODO: Test goes here... 
    }


} 
