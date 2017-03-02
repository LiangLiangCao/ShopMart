/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.controller;

import com.alibaba.fastjson.JSONObject;
import edu.zju.cst.constant.SystemConstant;
import edu.zju.cst.service.IUserService;
import edu.zju.cst.util.HttpUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Liang on 25/02/2017.
 */

@Controller
@RequestMapping(value="custom")
public class CustomLoginController extends BaseController {


    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String getLogin(HttpServletRequest request, ModelMap modelMap) {
        return "/custom/login";
    }

    @RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public String usrLogout(HttpServletRequest request, ModelMap modelMap) {
        request.getSession().removeAttribute(SystemConstant.SESSION_CUSTOM);
        return "redirect:" + HttpUtils.getBasePath(request);
    }

    @ResponseBody
    @RequestMapping(value = "/login.json", method = RequestMethod.POST)
    public String usrLogin(@RequestParam(value = "name") String name,
                         @RequestParam(value = "password") String password,
                         HttpServletRequest request,
                         ModelMap modelMap) {
        JSONObject json = new JSONObject();
        try {
            if (StringUtils.isBlank(password)) {
                json.put("password", "password cannot be null.");
            }
            json.put("result", true);
            usrService.usrLogin(name, password, request);

        } catch (Exception e) {
            json.put("result", false);
            json.put("password", "email or password wrong.");
        }
        return json.toString();
    }
}
