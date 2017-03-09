package edu.zju.cst.controller;

import edu.zju.cst.service.impl.UserServiceImpl;
import edu.zju.cst.util.ResultSupport;
import org.junit.Assert;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.ModelMap;

import java.util.Collections;

/**
 * UserController Tester.
 *
 * @author <Authors name>
 * @version 1.0
 */
public class UserControllerTest {
    @InjectMocks
    private UserController userController;

    @Mock
    private UserServiceImpl userService;

    private ResultSupport result;

    @Before
    public void before() throws Exception {
        MockitoAnnotations.initMocks(this);
        result = new ResultSupport();
    }

    @After
    public void after() throws Exception {
    }


    /**
     * Method: manage(ModelMap map, @RequestParam(value = "page", required = false) Integer page,
     * @RequestParam(value = "perpage", required = false) Integer perpage)
     */
    @Test
    public void testManageSuccess() throws Exception {
        Integer page=2;
        Integer perpage=10;

        ModelMap map=new ModelMap();
        Assert.assertEquals("/ftl/admin/edit.html",userController.manage(map,page,perpage));
    }

    /**
     * Method: addNewUser(@RequestBody User user, HttpServletRequest request)
     */
    @Test
    public void testAddNewUser() throws Exception {
        //TODO: Test goes here...
    }

    /**
     * Method: getById(@RequestParam(value = "user_id") String userID, HttpServletRequest request)
     */
    @Test
    public void testGetById() throws Exception {
        //TODO: Test goes here...
    }

    /**
     * Method: updateUser(@RequestBody User user, HttpServletRequest request)
     */
    @Test
    public void testUpdateUser() throws Exception {
        //TODO: Test goes here...
    }

    /**
     * Method: delete(@RequestParam(value = "user_id") long userId,
     * HttpServletRequest request)
     */
    @Test
    public void testDelete() throws Exception {
        //TODO: Test goes here...
    }


} 
