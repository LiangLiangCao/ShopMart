/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */
package edu.zju.cst.controller;


import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.service.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Liang on 25/02/2017.
 */
@Controller
public class BaseController {
    protected final Logger logger =Logger.getLogger(this.getClass());
    protected HttpServletRequest request;

    @Autowired
    protected IUserService usrService;
    @Autowired
    protected IProductService productService;
    @Autowired
    protected ISupplierService supplierService;
    @Autowired
    protected IOrderService orderService;
    @Autowired
    protected ICategoryService categoryService;


    //① 获取保存在Session中的用户对象
    protected User getSessionUser(HttpServletRequest request) {
        this.request = request;
        return (User) request.getSession().getAttribute(SystemConstants.SESSION_CUSTOM);
    }

    //②将用户对象保存到Session中
    protected void setSessionUser(HttpServletRequest request,User user) {
        request.getSession().setAttribute(SystemConstants.SESSION_CUSTOM,
                user);
    }
    //① 获取保存在Session中的用户对象
    protected User getSessionAdmin(HttpServletRequest request) {
        this.request = request;
        return (User) request.getSession().getAttribute(SystemConstants.SESSION_ADMIN);
    }

    //②将用户对象保存到Session中
    protected void setSessionAdmin(HttpServletRequest request,User user) {
        request.getSession().setAttribute(SystemConstants.SESSION_ADMIN,user);
    }

    //① 获取保存在Session中的用户对象
    protected User getSessionSupply(HttpServletRequest request) {
        this.request = request;
        return (User) request.getSession().getAttribute(SystemConstants.SESSION_SUPPLY);
    }

    //②将用户对象保存到Session中
    protected void setSessionSupplyr(HttpServletRequest request,User user) {
        request.getSession().setAttribute(SystemConstants.SESSION_SUPPLY,
                user);
    }
}
