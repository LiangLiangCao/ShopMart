package edu.zju.cst.controller;

import edu.zju.cst.bean.Product;
import edu.zju.cst.bean.User;
import edu.zju.cst.service.IProductService;
import edu.zju.cst.service.IUserService;
import edu.zju.cst.service.UserServiceImpl;
import edu.zju.cst.service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * Created by Liang on 19/02/2017.
 */
@Controller
public class MainController {
    @Autowired
    private IUserService usrService;

    @Autowired
    private IProductService productService;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome(ModelMap map) {

        List<Product> productList = productService.getProducts(10,1);

        map.put("latestProduct",productList);

        map.put("some", "spring freemarker模板终能使用");

        return "welcome";
    }


    //    @ModelAttribute("command")
    @RequestMapping(value = "/toJson", method = RequestMethod.POST)
    @ResponseBody
    public User toJson(@ModelAttribute("command")User usr) {

        System.out.print(usr);
        usrService.addUser(usr);

        return null;
//        return usrService.selectById(2);
    }

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String index() {
        return "index";
    }
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test(ModelMap map) {
        map.put("some", "spring freemarker模板终能使用");
        return "test";
    }

    @RequestMapping(value = "/nice", method = RequestMethod.GET)
    public String nice(Model model) {
        model.addAttribute("result", "hahaha 第一个参数");
        return "nice";
    }

}
