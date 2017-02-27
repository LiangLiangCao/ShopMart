package edu.zju.cst.exception;

/**
 * Created by Liang on 25/02/2017.
 */



import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DefaultExceptionHandler implements HandlerExceptionResolver {

    private static final long serialVersionUID = 1L;

    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        ModelAndView mv = new ModelAndView();
        if (e instanceof Exception) {

            mv.setViewName("redirect:/login");
        }
        return mv;
    }
}
