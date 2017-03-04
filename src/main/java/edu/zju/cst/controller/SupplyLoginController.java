/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.controller;

import com.alibaba.fastjson.JSONObject;
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.util.HttpUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by SX2601 on 2017/2/28.
 */
@RequestMapping(value="supply")
@Controller
public class SupplyLoginController extends BaseController {


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin(HttpServletRequest request, ModelMap modelMap) {
        return "/supply/login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String usrLogout(HttpServletRequest request, ModelMap modelMap) {
        request.getSession().removeAttribute(SystemConstants.SESSION_SUPPLY);
        return "redirect:" + HttpUtils.getBasePath(request);
    }

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String usrLogin(@RequestParam(value = "name") String name,
                           @RequestParam(value = "password") String password,
                           HttpServletRequest request,
                           ModelMap modelMap) {
        JSONObject json = new JSONObject();
        try {

            json.put("result", "true");
            supplierService.supplierLogin(name, password, request);

        } catch (Exception e) {
            json.put("result", "false");
            json.put("password", "email or password wrong.");
        }
        return json.toString();
    }

}
