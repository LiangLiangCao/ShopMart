package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import edu.zju.cst.bean.User;
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
public class LoginController extends BaseController {
    @Autowired
    private IUserService usrService;

    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String getLogin(HttpServletRequest request, ModelMap modelMap) {
        return "login";
    }

    @RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public String usrLogout(HttpServletRequest request, ModelMap modelMap) {
        request.getSession().removeAttribute(SystemConstant.SESSION_ADMIN);
        return "redirect:" + HttpUtils.getBasePath(request);
    }

    @ResponseBody
    @RequestMapping(value = "/login.json", method = RequestMethod.POST)
    public String usrLogin(@RequestParam(value = "name") String name,
                         @RequestParam(value = "password") String password,
                         HttpServletRequest request,
                         ModelMap modelMap) {
        JSONObject json = new JSONObject();
        System.out.println("=============================usrLogin1.0");
        try {

            json.put("result", "true");
            System.out.println("=============================usrLogin1.1");
            usrService.usrLogin(name, password, request);
            System.out.println("=============================usrLogin1.2");

        } catch (Exception e) {
            json.put("result", "false");
            json.put("password", "邮箱或密码错误");
        }
        return json.toString();
    }

}
