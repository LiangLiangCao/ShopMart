/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.controller;

import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.util.HttpUtils;
import edu.zju.cst.util.ResultSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by SX2601 on 2017/2/28.
 */
@RequestMapping(value = "supply")
@Controller
public class SupplyLoginController extends BaseController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin(@RequestParam(value = "redirect", required = false) String redirect,
                           HttpServletRequest request, ModelMap modelMap) {
        if (redirect == null) {
            redirect = "/supply/product/";
        }
        modelMap.put("redirect", redirect);
        return "/ftl/supply/login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String usrLogout(HttpServletRequest request, ModelMap modelMap) {
        request.getSession().removeAttribute(SystemConstants.SESSION_SUPPLY);
        return "redirect:" + HttpUtils.getBasePath(request);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String usrLogin(@RequestParam(value = "name") String name,
                           @RequestParam(value = "password") String password,
                           @RequestParam(value="redirect" ,required = false)String redirect,
                           HttpServletRequest request, ModelMap modelMap) {
        ResultSupport result = new ResultSupport();
        try {
            result.setCode(1);
            supplierService.supplierLogin(name, password, request);
            if(redirect!=null){
                return  "redirect:"+HttpUtils.getBasePath(request)+redirect;
            }
        } catch (Exception e) {
            result.setCode(0);
            result.setMsg("email or password wrong.");
            e.printStackTrace();
        }
        return "redirect:"+HttpUtils.getBasePath(request)+"/supply/login";
    }
}
