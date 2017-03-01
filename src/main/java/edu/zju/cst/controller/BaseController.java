/*
 *  CMB Confidential
 *
 *  Copyright (C) 2016 China Merchants Bank Co., Ltd. All rights reserved.
 *
 *  No part of this file may be reproduced or transmitted in any form or by any
 *  means, electronic, mechanical, photocopying, recording, or otherwise, without
 *  prior written permission of China Merchants Bank Co., Ltd.
 */
package edu.zju.cst.controller;


import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstant;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Liang on 25/02/2017.
 */
@Controller
public class BaseController {
    protected final Logger logger =Logger.getLogger(this.getClass());
    private HttpServletRequest request;

    //① 获取保存在Session中的用户对象
    protected User getSessionUser(HttpServletRequest request) {
        this.request = request;
        return (User) request.getSession().getAttribute(SystemConstant.SESSION_CUSTOM);
    }

    //②将用户对象保存到Session中
    protected void setSessionUser(HttpServletRequest request,User user) {
        request.getSession().setAttribute(SystemConstant.SESSION_CUSTOM,
                user);
    }
    //① 获取保存在Session中的用户对象
    protected User getSessionAdmin(HttpServletRequest request) {
        this.request = request;
        return (User) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
    }

    //②将用户对象保存到Session中
    protected void setSessionAdmin(HttpServletRequest request,User user) {
        request.getSession().setAttribute(SystemConstant.SESSION_ADMIN,user);
    }

    //① 获取保存在Session中的用户对象
    protected User getSessionSupply(HttpServletRequest request) {
        this.request = request;
        return (User) request.getSession().getAttribute(SystemConstant.SESSION_SUPPLY);
    }

    //②将用户对象保存到Session中
    protected void setSessionSupplyr(HttpServletRequest request,User user) {
        request.getSession().setAttribute(SystemConstant.SESSION_SUPPLY,
                user);
    }
}
