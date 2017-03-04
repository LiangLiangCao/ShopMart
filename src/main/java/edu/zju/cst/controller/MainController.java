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
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * Created by Liang on 19/02/2017.
 */
@Controller
public class MainController extends BaseController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome(ModelMap map) {

        List<Product> productList = productService.getProducts(10,1);
        map.put("latestProduct",productList);

        return "welcome";
    }

    @RequestMapping(value="/product/{id}",method=RequestMethod.GET)
    public String product(@PathVariable Long id,ModelMap map) {

        Product product = productService.get(id+"");

        if(product != null){
            map.put("product",product);
        }
        return "/product/detail";
    }

}
