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
import edu.zju.cst.util.ResultSupport;
import org.apache.commons.lang.StringUtils;

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
 * Created by Liang on 2/25/17.
 */
@Controller
@RequestMapping("/admin/user")
public class UserController extends BaseController {

    /**
     * todo
     * 进入管理员管理页面
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
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
        ResultSupport result = new ResultSupport();
        if (email.equals("") || StringUtils.isBlank(password)) {

            result.setCode(0);
            result.setMsg("email or password cannot be null");
            return JSON.toJSONString(result);
        }
        User user = usrService.findByEmail(email);
        if (user == null) {
            int re = usrService.addUser(email, password, role);
            if (re > 0) {
                result.setCode(re);
            } else {
                result.setCode(0);
                result.setMsg("添加错误");
            }
        }
        return JSON.toJSONString(result);
    }

    /**
     * 根据id查询用户
     */
    @ResponseBody
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public String getById(@RequestParam(value = "user_id") String user_id, HttpServletRequest request) {
        User user = usrService.findByID(Long.parseLong(user_id.trim()));
        return JSON.toJSONString(user);
    }
    /**
     * 更新用户信息
     */
    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateUser(@RequestBody User user, HttpServletRequest request) {
        int re= usrService.updateByID(user);
        ResultSupport result = new ResultSupport();
        if (re > 0) {
            result.setCode(re);
        } else {
            result.setCode(0);
            result.setMsg("update错误");

        }
        return JSON.toJSONString(result);
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "user_id") long user_id, HttpServletRequest request) {
        int re =  usrService.deleteByID(user_id);

        ResultSupport result = new ResultSupport();
        if (re > 0) {
            result.setCode(re);
            return JSON.toJSONString(result);
        } else {
            result.setCode(0);
            result.setMsg("delete错误");
            return JSON.toJSONString(result);
        }
    }

}
