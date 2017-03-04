/*
 *  LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.User;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by SX2601 on 2017/2/28.
 */
@Controller
@RequestMapping(value = "usrmanage")
public class ManageUserController extends BaseController {

    /**
     * todo
     * 进入管理员管理页面
     */
    @RequestMapping(value = "/manage", method = RequestMethod.GET)
    public String manage(ModelMap modelMap) {
        List<User> usrs = usrService.getAllListPage(10, 1);
        modelMap.put("users", usrs);
        return "admin/manage";
    }

    /**
     * 添加Admin
     */
    @ResponseBody
    @RequestMapping(value = "/addNew", method = RequestMethod.POST)
    public String addNewUser(@RequestParam(value = "email") String email,
                             @RequestParam(value = "password") String password,
                             @RequestParam(value = "role") String role) {
        JSONObject json = new JSONObject();
        if (email.equals("") || StringUtils.isBlank(password)) {
            json.put("email", "email or password cannot be null");
            return json.toString();
        }
        User user = usrService.findByEmail(email);
        if (user == null) {
            try {
                usrService.addUser(email, password, role);
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
     * 根据id查询用户
     */
    @ResponseBody
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public String getById(@RequestParam(value = "uid") String uid, HttpServletRequest request) {
        User user = usrService.findByID(Long.parseLong(uid.trim()));
        return JSON.toJSONString(user);
    }
    /**
     * 更新用户信息
     */
    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateUser(@RequestBody User user, HttpServletRequest request) {
        JSONObject json = new JSONObject();
        try{
             int re= usrService.updateByID(user);
            json.put("result", true);
         }catch(Exception e){
            json.put("result", false);
            json.put("password", e.getMessage());
        }
        return json.toString();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "uId") long uId, HttpServletRequest request) {
        JSONObject json = new JSONObject();
        try {
            usrService.deleteByID(uId);
            json.put("result", true);
        } catch (Exception e) {
            json.put("result", false);
            json.put("password", e.getMessage());
        }
        return json.toString();
    }

}
