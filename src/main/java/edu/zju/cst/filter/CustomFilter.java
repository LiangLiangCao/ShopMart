/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
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
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/**
 * 
 * 管理过滤器
 * 
 * @author Herbert
 * 
 */
public class CustomFilter implements Filter {

	protected final Logger logger = Logger.getLogger(this.getClass());

	protected FilterConfig filterConfig = null;
	private String redirectURL = null;
	private List notCheckURLList = new ArrayList();
	private String sessionKey = null;

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;

		User usr = (User) request.getSession().getAttribute(sessionKey);
		if (usr == null&&(!checkRequestURIIntNotFilterList(request))) {
			response.sendRedirect(HttpUtils.getBasePath(request)+redirectURL);
		}
		filterChain.doFilter(servletRequest, servletResponse);
	}

	public void destroy() {
		notCheckURLList.clear();
	}

	private boolean checkRequestURIIntNotFilterList(HttpServletRequest request) {
		String uri = request.getServletPath() + (request.getPathInfo() == null ? "" : request.getPathInfo());
		return notCheckURLList.contains(uri);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		redirectURL = filterConfig.getInitParameter("redirectURL");
		sessionKey = SystemConstant.SESSION_CUSTOM;

		String notCheckURLListStr = filterConfig.getInitParameter("notCheckURLList");

		if (notCheckURLListStr != null) {
			StringTokenizer st = new StringTokenizer(notCheckURLListStr, ";");
			notCheckURLList.clear();
			while (st.hasMoreTokens()) {
				notCheckURLList.add(st.nextToken());
			}
		}
	}
}
