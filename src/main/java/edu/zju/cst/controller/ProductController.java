package edu.zju.cst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Liang on 2/25/17.
 */

@Controller
@RequestMapping("/product")
public class ProductController {

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String productList(ModelMap map) {
        map.put("some", "spring freemarker模板终能使用");
        return "product";
    }


    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public String delProduct(ModelMap map) {
        map.put("some", "spring freemarker模板终能使用");
        return "product";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addProduct(ModelMap map) {
        map.put("some", "spring freemarker模板终能使用");
        return "product";
    }
}
