package edu.zju.cst.service.impl;

import edu.zju.cst.bean.User;

import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.dao.UserMapper;
import edu.zju.cst.util.AuthUtils;
import org.springframework.mock.web.MockHttpServletRequest;
import org.junit.Test;
import org.junit.Before;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.springframework.mock.web.MockHttpSession;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyLong;
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

    @Mock
    private MockHttpServletRequest request;

    @Mock
    private MockHttpSession session;

    @Before
    public void before() throws Exception {
        //初始化对象的注解
        userService = new UserServiceImpl();

        request = new MockHttpServletRequest();
        session = new MockHttpSession();
        request.setCharacterEncoding("UTF-8");
        request.setMethod("POST");
        request.addParameter("viewDetails", "true");
        request.setSession(session);
        MockitoAnnotations.initMocks(this);
    }

    /**
     * Method: deleteByID(Long uid)
     */
    @Test
    public void testDeleteByID() throws Exception {
        Long id = new Long(1);
        when(userMapper.deleteByPrimaryKey(anyLong())).thenReturn(1);
        userService.deleteByID(id);
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
        when(userMapper.selectByPrimaryKey(id)).thenAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("testFindByID");
                return null;
            }
        });
        userService.findByID(id);

    }

    /**
     * Method: findByEmail(String email)
     */
    @Test
    public void testFindByEmail() throws Exception {
        String email = "6325653@qq.com";
        when(userMapper.selectByEmail(email)).thenAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("find users");
                return null;
            }
        });
        userService.findByEmail(email);
    }

    /**
     * Method: updateByID(User record)
     */
    @Test
    public void testUpdateByID() throws Exception {

        User user = new User();
        user.setUserId(new Long(1));
        user.setPassword("1");
        when(userMapper.updateByPrimaryKey(user)).thenAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("testUpdateByID");
                return null;
            }
        });
        userService.updateByID(user);
    }

    /**
     * Method: adminLogin(String name, String password, HttpServletRequest request)
     */
    @Test
    public void testAdminLogin() throws Exception {
        User user = new User();
        user.setUserId(Long.parseLong("1"));
        user.setPassword(AuthUtils.getPassword("1"));
        user.setRole("1");

        session.setAttribute(SystemConstants.SESSION_ADMIN, user);

        when(userMapper.selectByPrimaryKey(Mockito.anyLong())).thenReturn(user);
        Mockito.doReturn(user).when(userMapper).selectByPrimaryKey(Mockito.anyLong());

        when(request.getSession()).thenReturn(session);
        userService.adminLogin("1", "1", request);
    }

    /**
     * Method: usrLogin(String name, String password, HttpServletRequest request)
     */
    @Test
    public void testUsrLogin() throws Exception {
        User user = new User();
        user.setUserId(Long.parseLong("3"));
        user.setPassword(AuthUtils.getPassword("1"));
        user.setRole("2");

        session.setAttribute(SystemConstants.SESSION_CUSTOM, user);

        when(userMapper.selectByPrimaryKey(Mockito.anyLong())).thenReturn(user);
        Mockito.doReturn(user).when(userMapper).selectByPrimaryKey(Mockito.anyLong());

        when(request.getSession()).thenReturn(session);
        userService.usrLogin("3", "1", request);
    }

    /**
     * Method: getAllListPage(int num, int pageNum)
     */
    @Test
    public void testGetAllListPage() throws Exception {
        int page = 1;
        int pageNum = 10;

        List<User> list = new ArrayList<User>();
        User user1 = new User();
        user1.setRole("2");
        user1.setUserId(Long.parseLong("3"));
        user1.setPassword(AuthUtils.getPassword("1"));
        user1.setUserId(1L);
        list.add(user1);
        list.add(user1);

        Mockito.doReturn(list).when(userMapper).selectByPageSize(Mockito.anyInt(), Mockito.anyInt());
        userService.getAllListPage(page, pageNum);
    }

    /**
     * Method: getCount()
     */
    @Test
    public void testGetCount() throws Exception {
        Integer tre = 8;
        Mockito.when(userMapper.countTotal()).thenReturn(tre);
        userService.getCount();
    }


} 
