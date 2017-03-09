package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.service.impl.UserServiceImpl;

import edu.zju.cst.util.ResultSupport;
import org.junit.Assert;
import org.junit.Test;
import org.junit.Before;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;

import static org.mockito.Matchers.any;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.when;

/**
 * UserController Tester.
 *
 * @author <Authors name>
 * @version 1.0
 */

@Transactional
public class UserControllerTest {
    @InjectMocks
    private UserController userController;

    @Mock
    private UserServiceImpl userService;

    @Mock
    private HttpServletRequest request;

    private ResultSupport result;

    @Before
    public void before() throws Exception {
        userController = new UserController();
        MockitoAnnotations.initMocks(this);
        result = new ResultSupport();

        User user = new User();
        user.setPassword("1");
        user.setRole(SystemConstants.ADMIN_KIND_USR);
        user.setEmail("5353748@qq.com");


        when(request.getAttribute(SystemConstants.SESSION_CUSTOM)).thenReturn(user);


    }


    /**
     * Method: manage(ModelMap map, @RequestParam(value = "page", required = false) Integer page,
     *
     * @RequestParam(value = "perpage", required = false) Integer perpage)
     */
    @Test
    public void testManageSuccess() throws Exception {

        Integer page = new Integer(2);
        Integer perpage = new Integer(10);

        when(userService.getAllListPage(page, perpage)).thenAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("testManageSuccess");
                return null;
            }
        });


        doAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("get count");
                return null;
            }
        }).when(userService).getCount();


        ModelMap map = new ModelMap();
        map.put("user", userService.getAllListPage(page, perpage));
        userController.manage(map, page, perpage);
        Assert.assertEquals("/ftl/admin/edit", userController.manage(map, page, perpage));

    }

    /**
     * Method: addNewUser(@RequestBody User user, HttpServletRequest request)
     */
    @Test
    public void testAddNewUserSucess() throws Exception {

        doAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("testAddNewUserSucess");
                return null;
            }
        }).when(userService).addUser(any(User.class));

        User user = new User();
        user.setPassword("1");
        user.setRole(SystemConstants.ADMIN_KIND_USR);
        user.setEmail("51213@qq.com");

        userController.addNewUser(user, request);
//        result=JSON.parseObject(re,ResultSupport.class);
//System.out.print("+==========="+result.getMsg());
//        Assert.assertEquals(1,result.getCode());
    }

    /**
     * Method: addNewUser(@RequestBody User user, HttpServletRequest request)
     */
    @Test
    public void testAddNewUserErorr() throws Exception {
        doAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("testAddNewUserErorr");
                return null;
            }
        }).when(userService).addUser(any(User.class));
        User user = new User();

        String re = userController.addNewUser(user, request);
        result = JSON.parseObject(re, ResultSupport.class);

        Assert.assertEquals(0, result.getCode());
    }

    /**
     * Method: getById(@RequestParam(value = "user_id") String userID, HttpServletRequest request)
     */
    @Test
    public void testGetById() throws Exception {
        doAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("testGetById");
                return null;
            }
        }).when(userService).findByID(any(Long.class));
        userController.getById("1",request);
    }

    /**
     * Method: updateUser(@RequestBody User user, HttpServletRequest request)
     */
    @Test
    public void testUpdateUser() throws Exception {
        doAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("testUpdateUser");
                return null;
            }
        }).when(userService).updateByID(any(User.class));

        User user = new User();
        user.setPassword("1");
        user.setUserId(1L);
        user.setRole(SystemConstants.ADMIN_KIND_USR);
        user.setEmail("51213@qq.com");

        String re = userController.updateUser(user, request);
//        result = JSON.parseObject(re, ResultSupport.class);
//        System.out.print("+===========" + result.getCode());
//        Assert.assertEquals(1, result.getCode());

    }

    /**
     * Method: delete(@RequestParam(value = "user_id") long userId,
     * HttpServletRequest request)
     */
    @Test
    public void testDelete() throws Exception {
        Long uId = new Long(1);
        when(userService.deleteByID(uId)).thenAnswer(new Answer<Void>() {
            public Void answer(InvocationOnMock invocation) throws Throwable {
                System.out.println("testDelete");
                return null;
            }
        });
        userController.delete(uId,request);
    }


} 
