package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.service.IUserService;

import edu.zju.cst.util.ResultSupport;
import org.junit.Assert;
import org.junit.Test;
import org.junit.Before;

import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.mock.web.MockHttpServletRequest;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyLong;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
/**
 * UserController Tester.
 *
 * @author <Authors name>
 * @version 1.0
 */


//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"classpath:applicationContext.xml"})

@Transactional
public class UserControllerTest {
//    @InjectMocks
//    private UserController userController=mock(UserController.class);
    @InjectMocks
    private UserController userController= new UserController();;
    @Mock
    private IUserService userService;

    @Mock
    private MockHttpServletRequest request;

    private ResultSupport result;

    @Before
    public void before() throws Exception {

        MockitoAnnotations.initMocks(this);
        result = new ResultSupport();

        User user = new User();
        user.setPassword("1");
        user.setRole(SystemConstants.ADMIN_KIND_USR);
        user.setEmail("5353748@qq.com");

        request = new MockHttpServletRequest();
    }


    /**
     * Method: manage(ModelMap map, @RequestParam(value = "page", required = false) Integer page,
     *
     * @RequestParam(value = "perpage", required = false) Integer perpage)
     */
    @Test
    public void testManageSuccess() {
        Integer pageNumber = 2;
        Integer pageSize = new Integer(10);
        Integer count = new Integer(20);

        List<User> list = new ArrayList<User>();
        User user = new User();
        user.setPassword("1");
        user.setRole(SystemConstants.ADMIN_KIND_USR);
        user.setEmail("5353748@qq.com");

        list.add(user);
        list.add(user);

        when(userService.getAllListPage(Mockito.anyInt(), Mockito.anyInt())).thenReturn(list);
        Mockito.doReturn(count).when(userService).getCount();

        ModelMap map = new ModelMap();
        //map.put("user", userService.getAllListPage(pageNumber, pageSize));
        userController.manage(map, pageNumber, pageSize);
        Assert.assertEquals("/ftl/admin/edit", userController.manage(map, pageNumber, pageSize));
        Assert.assertEquals(map.get("total"), count);
    }

    /**
     * Method: addNewUser(@RequestBody User user, HttpServletRequest request)
     */
    @Test
    public void testAddNewUserSucess() throws Exception {
        doReturn(1).when(userService).addUser(any(User.class));

        User user = new User();
        user.setPassword("1");
        user.setRole(SystemConstants.ADMIN_KIND_USR);
        user.setEmail("51213@qq.com");

        String re = userController.addNewUser(user, request);
        result = JSON.parseObject(re, ResultSupport.class);
        Assert.assertEquals(1, result.getCode());
    }

    /**
     * Method: addNewUser(@RequestBody User user, HttpServletRequest request)
     */
    @Test
    public void testAddNewUserErorr() throws Exception {
        User user = new User();
        user.setPassword("1");
        user.setRole(SystemConstants.ADMIN_KIND_USR);
        user.setEmail("51213@qq.com");

        doReturn(0).when(userService).addUser(any(User.class));

        String re = userController.addNewUser(user, request);
        result = JSON.parseObject(re, ResultSupport.class);

        Assert.assertEquals(0, result.getCode());
    }

    /**
     * Method: getById(@RequestParam(value = "user_id") String userID, HttpServletRequest request)
     */
    @Test
    public void testGetById() throws Exception {
        User user = new User();
        user.setPassword("1");
        user.setUserId(1L);
        user.setRole(SystemConstants.ADMIN_KIND_USR);
        user.setEmail("51213@qq.com");

        doReturn(user).when(userService).findByID(anyLong());
        userController.getById("1", request);
    }

    /**
     * Method: updateUser(@RequestBody User user, HttpServletRequest request)
     */
    @Test
    public void testUpdateUser() throws Exception {
        doReturn(1).when(userService).updateByID(any(User.class));

        User user = new User();
        user.setPassword("1");
        user.setUserId(1L);
        user.setRole(SystemConstants.ADMIN_KIND_USR);
        user.setEmail("51213@qq.com");

        String re = userController.updateUser(user, request);
        result = JSON.parseObject(re, ResultSupport.class);
        Assert.assertEquals(1, result.getCode());
    }

    /**
     * Method: delete(@RequestParam(value = "user_id") long userId,
     * HttpServletRequest request)
     */
    @Test
    public void testDelete() throws Exception {
        Long uId = new Long(1);
        when(userService.deleteByID(uId)).thenReturn(1);
        userController.delete(uId, request);
    }
} 
