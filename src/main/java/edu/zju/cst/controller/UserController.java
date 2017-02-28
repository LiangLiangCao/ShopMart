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
import edu.zju.cst.service.IUserService;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Liang on 28/02/2017.
 */
@Controller
@RequestMapping(value = "/admin")
public class UserController extends BaseController {

    @Autowired
    private IUserService usrService;

    /**
     * 进入添加admin页面
     */
    @RequestMapping(value = "/add.htm", method = RequestMethod.GET)
    public String addUser(ModelMap modelMap) {
        modelMap.put("email", "");
        modelMap.put("password", "");
        modelMap.put("role","1");
        return "admin/add";
    }

    /**
     * 进入管理员管理页面
     */
    @RequestMapping(value = "/manage.htm", method = RequestMethod.GET)
    public String manage(@RequestParam(value = "p", defaultValue = "1") int pageNum, ModelMap modelMap) {
        modelMap.put("pageVo", usrService.getAllListPage(pageNum));
        return "admin/manage";
    }

    /**
     * 添加Admin
     */
    @ResponseBody
    @RequestMapping(value = "/addNew.json", method = RequestMethod.POST)
    public String addNewUser(
            @RequestParam(value = "email") String adminName,
            @RequestParam(value = "password") String password) {
        JSONObject json = new JSONObject();
//        User user = usrService.getAdminByName(adminName);
//        if (user == null) {
//        } else {
//            json.put("adminName", "管理员名称不能重复");
//        }
        try {
            if (adminName.equals("")) {
                json.put("adminName", "管理员名称不能为空");
            }
            if (StringUtils.isBlank(password)) {
                json.put("password", "管理员密码不能为空");
            } else if (password.length() < 6) {
                json.put("password", "密码不能小于6位");
            } else if (password.length() > 16) {
                json.put("password", "密码不能大于16位");
            }

//            usrService.addAdmin(adminName.trim(),password);
            json.put("result", true);
        } catch (Exception e) {
            json.put("result", false);
            json.put("password", e.getMessage());
        }
        return json.toString();
    }

    /**
     * 进入管理员列表页面
     */
    @RequestMapping(value = "/page.htm", method = RequestMethod.GET)
    public String allList(
            @RequestParam(value = "p", defaultValue = "1") int pageNum,
            ModelMap modelMap) {
        modelMap.put("pageVo", usrService.getAllListPage(pageNum));
        return "/admin/all";
    }

    /**
     * 进入单个admmin页面
     */
    @RequestMapping(value = "/update.htm", method = RequestMethod.GET)
    public String update(
            @RequestParam(value = "adminId", defaultValue = "0") long adminId,
            ModelMap modelMap, HttpServletRequest request) {
//        User sessionAdmin = this.getAdmin(request);
//        User admin = usrService.getAdminById(sessionAdmin.getAdminId());
//        modelMap.put("admin", admin);
        return "/admin/update";
    }

    /**
     * 修改指定的admin资料
     */
    @ResponseBody
    @RequestMapping(value = "/update.json", method = RequestMethod.POST)
    public String updateAdmin(
            @RequestParam(value = "password") String password,
            HttpServletRequest request) {
        JSONObject json = new JSONObject();
        try {
            if (StringUtils.isBlank(password)) {
                json.put("password", "密码不能为空");
            }
            if (password.length() < 6) {
                json.put("password", "密码不能小于6位数");
            }
            if (password.length() > 18) {
                json.put("password", "密码不能大于18位数");
            }

//            SSUtils.toText(password);
//            User user = this.getAdmin(request);
//            usrService.updateAdminByAmdinId(admin.getAdminId(),
//                    SSUtils.toText(password));
            json.put("result", true);
        } catch (Exception e) {
            json.put("result", false);
            json.put("password", e.getMessage());
        }
        return json.toString();
    }

    /**
     * 删除管理员
     */

    @ResponseBody
    @RequestMapping(value = "/delete.json", method = RequestMethod.POST)
    public String delete(@RequestParam(value = "adminId") long adminId,
                         HttpServletRequest request) {
        JSONObject json = new JSONObject();
        try {
//            usrService.deleteAdmin(adminId);
            json.put("result", true);
        } catch (Exception e) {
            json.put("result", false);
            json.put("password", e.getMessage());
        }
        return json.toString();
    }

}
