package edu.zju.cst.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.zju.cst.util.HttpUtils;
import org.apache.log4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created by SX2601 on 2017/2/22.
 */
@Component
public class GlobalInterceptor implements HandlerInterceptor {


	public boolean preHandle(HttpServletRequest request,
							 HttpServletResponse response, Object handler) throws Exception {
		return true;
	}

	public void postHandle(HttpServletRequest request,
						   HttpServletResponse response, Object handler,
						   ModelAndView modelAndView) throws Exception {
		if (null == modelAndView) {
			return;
		}
		// 系统配置参数
		String basePath = HttpUtils.getBasePath(request);
		modelAndView.addObject("BASE_PATH", basePath);
		modelAndView.addObject("shopmart_title","ShopMart");
		modelAndView.addObject("shopmart_description","simple shopping web");
	}

	public void afterCompletion(HttpServletRequest request,
								HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
