package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.*;
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.util.HttpUtils;
import edu.zju.cst.util.ResultSupport;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Liang on 2/25/17.
 */

@Controller
@RequestMapping("order")
public class OrderController extends BaseController {


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showAll(ModelMap map,@RequestParam(value = "page", required=false) Integer page, @RequestParam(value = "perpage", required=false) Integer perpage) {

        if(perpage == null){
            perpage = 10;
        }
        if(page == null){
            page = 1;
        }

        List<Orders> orderList = orderService.getOrders(perpage,page);
        map.put("items",orderList);

        return "order/edit";
    }


    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public String get(ModelMap map, @RequestParam(value = "order_id") int id) {

        Orders order = orderService.get(id + "");
        return JSON.toJSONString(order);
    }


    @RequestMapping(value = "/del", method = RequestMethod.GET)
    @ResponseBody
    public String del(ModelMap map, @RequestParam(value = "order_id") Integer id) {

        int re = orderService.del(id + "");

        ResultSupport result = new ResultSupport();
        if (re > 0) {
            result.setCode(1);
        } else {
            result.setCode(0);
            result.setMsg("删除错误");
        }
        return JSON.toJSONString(result);

    }

    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    @ResponseBody
    public String pay(@RequestBody Product product,  HttpServletRequest request) {
        request.getSession().setAttribute(SystemConstants.SESSION_PRODUCT, product);
        ResultSupport result = new ResultSupport();

            result.setCode(1);

            result.setMsg(HttpUtils.getBasePath(request) + "/custom/payment");

        return JSON.toJSONString(result);
//        return "redirect:/" + HttpUtils.getBasePath(request) + "/custom/payment";
    }

    @RequestMapping(value = "/addNew", method = RequestMethod.POST)
    @ResponseBody
    public String addNew(@RequestParam(value = "name") String name,
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
            Product product = (Product) request.getSession().getAttribute(SystemConstants.SESSION_PRODUCT);
            request.getSession().removeAttribute(SystemConstants.SESSION_PRODUCT);

            int re = orderService.addOrder(product);
//TODO:页面跳转
            if (re > 0) {
                result.setCode(re);
            } else {
                result.setCode(0);
                result.setMsg("order添加错误");

            }
        } catch (Exception e) {
            result.setCode(0);
            result.setMsg("email or password wrong.");
            e.printStackTrace();
        }
        return JSON.toJSONString(result);

    }

    @RequestMapping(value = "/addByProduct", method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestBody Product product) {

        int re = orderService.addOrder(product);

        ResultSupport result = new ResultSupport();
        if (re > 0) {
            result.setCode(re);
        } else {
            result.setCode(0);
            result.setMsg("添加错误");

        }
        return JSON.toJSONString(result);

    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestBody Orders order) {

        int re = orderService.add(order);

        ResultSupport result = new ResultSupport();
        if (re > 0) {
            result.setCode(re);
        } else {
            result.setCode(0);
            result.setMsg("添加错误");

        }
        return JSON.toJSONString(result);

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(@RequestBody Orders order) {

        int re = orderService.update(order);

        ResultSupport result = new ResultSupport();
        if (re > 0) {
            result.setCode(1);
        } else {
            result.setCode(0);
            result.setMsg("更新错误");
        }
        return JSON.toJSONString(result);

    }


}
