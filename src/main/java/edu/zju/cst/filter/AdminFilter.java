/*
 *  CMB Confidential
 *
 *  Copyright (C) 2016 China Merchants Bank Co., Ltd. All rights reserved.
 *
 *  No part of this file may be reproduced or transmitted in any form or by any
 *  means, electronic, mechanical, photocopying, recording, or otherwise, without
 *  prior written permission of China Merchants Bank Co., Ltd.
 */

package edu.zju.cst.filter;

import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstant;
import edu.zju.cst.util.HttpUtils;
import org.apache.log4j.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by SX2601 on 2017/2/28.
 */
public class AdminFilter implements Filter {

    protected final Logger logger = Logger.getLogger(this.getClass());

    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        User usr = (User) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
        if (usr == null) {
            response.sendRedirect(HttpUtils.getBasePath(request) + "/admin/login.htm");
        } else {
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
        // TODO Auto-generated method stub
    }
}
