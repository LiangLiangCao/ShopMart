/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.controller;


import edu.zju.cst.bean.User;
import edu.zju.cst.service.IUserService;
import edu.zju.cst.util.AuthUtils;
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
 * Created by SX2601 on 2017/2/28.
 */
@Controller
@RequestMapping(value = "admin/manage")
public class ManageUserController {

    @Autowired
    private IUserService usrService;

    /**
     * 进入添加admin页面
     */
    @RequestMapping(value = "/add.htm", method = RequestMethod.GET)
    public String addUser(ModelMap modelMap) {
        modelMap.put("email", "");
        modelMap.put("password", "");
        return "admin/add";
    }

    /**
     * todo
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
    public String addNewUser(@RequestParam(value = "email") String email,
                             @RequestParam(value = "password") String password,
                             @RequestParam(value = "role") String role) {
        JSONObject json = new JSONObject();
        User user = usrService.findByEmail(email);
        if (user == null) {

            try {

                if (email.equals("")||StringUtils.isBlank(password)) {
                    json.put("email", "email or password cannot be null");
                    return json.toString();
                }
                user=new User();
                user.setRole(role);
                user.setEmail(email.trim());
                user.setPassword(AuthUtils.setMD5(password));
                usrService.addUserSelective(user);
                json.put("result", true);
            } catch (Exception e) {
                json.put("result", false);
                json.put("password", e.getMessage());
            }
        } else {
            json.put("email", "email exist.");
            json.put("result", false);
        }

        return json.toString();
    }

    /**
     * 进入管理员列表页面
     */
    @RequestMapping(value = "/page.htm", method = RequestMethod.GET)
    public String allList(@RequestParam(value = "p", defaultValue = "1") int pageNum, ModelMap modelMap) {
        modelMap.put("pageVo", usrService.getAllListPage(pageNum));
        return "/admin/all";
    }

    /**
     * 进入单个admmin页面
     */
    @RequestMapping(value = "/update.htm", method = RequestMethod.GET)
    public String update(@RequestParam(value = "adminId", defaultValue = "0") long adminId, ModelMap modelMap,
                         HttpServletRequest request) {
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
    public String updateAdmin(@RequestParam(value = "password") String password, HttpServletRequest request) {
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
    public String delete(@RequestParam(value = "adminId") long adminId, HttpServletRequest request) {
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
