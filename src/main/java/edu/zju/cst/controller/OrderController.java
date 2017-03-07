package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.*;
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.util.HttpUtils;
import edu.zju.cst.util.ResultSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Liang on 2/25/17.
 */

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showAll(ModelMap map,
                          @RequestParam(value = "page", required = false) Integer page,
                          @RequestParam(value = "perpage", required = false) Integer perpage) {
        if (perpage == null) {
            perpage = SystemConstants.PER_PAGE;
        }
        if (page == null) {
            page = SystemConstants.FIRST_PAGE;
        }
        int count = orderService.getCount();
        map.put("total", count);
        map.put("page", page);
        map.put("perpage", perpage);
        map.put("lastPage", (int) Math.ceil(count / (double) perpage));
        List<Orders> orderList = orderService.getOrders(perpage, page);
        map.put("items", orderList);

        return "/ftl/order/edit";
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

    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    @ResponseBody
    public String pay(@RequestBody Product product, HttpServletRequest request) {
        request.getSession().setAttribute(SystemConstants.SESSION_PRODUCT, product);
        ResultSupport result = new ResultSupport();
        result.setCode(1);
        result.setMsg(HttpUtils.getBasePath(request) + "/custom/info");

        return JSON.toJSONString(result);
        //        return "redirect:/" + HttpUtils.getBasePath(request) + "/custom/payment";
    }
}
