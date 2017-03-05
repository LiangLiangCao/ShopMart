/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.Product;
import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.util.HttpUtils;
import edu.zju.cst.util.ResultSupport;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Liang on 25/02/2017.
 */

@Controller
@RequestMapping(value = "custom")
public class CustomLoginController extends BaseController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin(HttpServletRequest request, ModelMap modelMap) {
        return "/custom/login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String usrLogout(HttpServletRequest request, ModelMap modelMap) {
        request.getSession().removeAttribute(SystemConstants.SESSION_CUSTOM);
        return "redirect:" + HttpUtils.getBasePath(request);
    }

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String usrLogin(@RequestParam(value = "name") String name,
                           @RequestParam(value = "password") String password,
                           HttpServletRequest request,
                           ModelMap modelMap) {
        ResultSupport result = new ResultSupport();
        try {
            if (StringUtils.isBlank(password)) {
                result.setCode(0);
                result.setMsg("password cannot be null.");
            }
            result.setCode(1);
            usrService.usrLogin(name, password, request);

        } catch (Exception e) {
            result.setCode(0);
            result.setMsg("email or password wrong.");
            e.printStackTrace();
        }
        return JSON.toJSONString(result);
    }

    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public String payment(HttpServletRequest request,
                          ModelMap map) {
        User user = (User) request.getSession().getAttribute(SystemConstants.SESSION_CUSTOM);
        if (user != null) {
            map.put("username", user.getUserId());
        } else {
            map.put("username", "xcb");
        }
        return "/custom/payment";
    }

    @ResponseBody
    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    public String pay(@RequestBody User user,
                      HttpServletRequest request,
                      ModelMap modelMap) {
        ResultSupport result = new ResultSupport();
        try {
            if (StringUtils.isBlank(user.getPassword())) {
                result.setCode(0);
                result.setMsg("password cannot be null.");
            }
            user.setRole("2");
            usrService.usrLogin(user.getUserId().toString(), user.getPassword(), request);
            Product product = (Product) request.getSession().getAttribute(SystemConstants.SESSION_PRODUCT);
            if (product != null) {
                int re = orderService.addOrder(product);
                if (re > 0) {
                    result.setCode(re);
                    result.setMsg("购买完成。");
                } else {
                    result.setCode(0);
                    result.setMsg("购买错误");
                }
            }
        } catch (Exception e) {
            result.setCode(0);
            result.setMsg("email or password wrong.");
            e.printStackTrace();
        }
        return JSON.toJSONString(result);
    }
}
