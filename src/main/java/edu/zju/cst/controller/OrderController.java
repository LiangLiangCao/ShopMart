package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.*;
import edu.zju.cst.util.ResultSupport;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Liang on 2/25/17.
 */

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showAll(ModelMap map) {

        List<Orders> orderList = orderService.getOrders(10,1);

        map.put("orders",orderList);
        return "order/edit";
    }

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public String get(ModelMap map,@RequestParam(value = "id") int id) {

        Orders order = orderService.get(id+"");
        return JSON.toJSONString(order);
    }


    @RequestMapping(value = "/del", method = RequestMethod.GET )
    @ResponseBody
    public String del(ModelMap map, @RequestParam(value = "id") int id) {

        int re = orderService.del(id+"");

        ResultSupport result = new ResultSupport();
        if(re>0){
            result.setCode(1);
            return JSON.toJSONString(result);
        }else {
            result.setCode(0);
            result.setMsg("删除错误");
            return JSON.toJSONString(result);
        }

    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestBody Product product) {

        int re = orderService.addOrder(product);

        ResultSupport result = new ResultSupport();
        if(re>0){
            result.setCode(re);
            return JSON.toJSONString(result);
        }else {
            result.setCode(0);
            result.setMsg("添加错误");
            return JSON.toJSONString(result);
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(@RequestBody Orders order) {

        int re = orderService.update(order);

        ResultSupport result = new ResultSupport();
        if(re>0){
            result.setCode(1);
            return JSON.toJSONString(result);
        }else {
            result.setCode(0);
            result.setMsg("更新错误");
            return JSON.toJSONString(result);
        }

    }


}
