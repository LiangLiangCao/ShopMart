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
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.util.HttpUtils;
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
    public String manage(ModelMap map,
                         @RequestParam(value = "page", required = false) Integer page,
                         @RequestParam(value = "perpage", required = false) Integer perpage) {
        if (perpage == null) {
            perpage = SystemConstants.PER_PAGE;
        }
        if (page == null) {
            page = SystemConstants.FIRST_PAGE;
        }
        int count = usrService.getCount();
        map.put("total", count);
        map.put("page", page);
        map.put("perpage", perpage);
        map.put("lastPage", (int) Math.ceil(count / (double) perpage));
        List<User> usrs = usrService.getAllListPage(perpage, page);
        map.put("users", usrs);
        return "/ftl/admin/edit";
    }

    /**
     * 添加Admin
     */
    @ResponseBody
    @RequestMapping(value = "/addNew", method = RequestMethod.POST)
    public String addNewUser(@RequestBody User user,
                             HttpServletRequest request) {
        ResultSupport result = new ResultSupport();
        String email = user.getEmail();
        String password = user.getPassword();
        String role = user.getRole();

        if (email==null||role==null||result==null||email.equals("") || StringUtils.isBlank(password)||role.equals("")) {
            result.setCode(0);
            result.setMsg("email or password cannot be null");
            return JSON.toJSONString(result);
        }
        User existUser = usrService.findByEmail(email);
        if (existUser == null) {
            int re = usrService.addUser(user);
            if (re > 0) {
                result.setCode(1);
                result.setMsg(HttpUtils.getBasePath(request) + "/admin/user/");
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
    public String getById(@RequestParam(value = "user_id") String userID, HttpServletRequest request) {
        User user = usrService.findByID(Long.parseLong(userID.trim()));
        return JSON.toJSONString(user);
    }

    /**
     * 更新用户信息
     */
    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateUser(@RequestBody User user, HttpServletRequest request) {
        int re = usrService.updateByID(user);
        ResultSupport result = new ResultSupport();
        if (re > 0) {
            result.setCode(re);
            result.setMsg(HttpUtils.getBasePath(request) + "/admin/user/");
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
    public String delete(@RequestParam(value = "user_id") long userId, HttpServletRequest request) {
        int re = usrService.deleteByID(userId);

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
