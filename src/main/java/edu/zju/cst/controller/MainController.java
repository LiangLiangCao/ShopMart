package edu.zju.cst.controller;

import edu.zju.cst.bean.Product;
import edu.zju.cst.bean.User;
import edu.zju.cst.service.IUserService;
import edu.zju.cst.service.UserServiceImpl;
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
        int count = productService.getCount();
        int perpage = 10;
        map.put("total",count);
        map.put("page",1);
        map.put("perpage",perpage);
        map.put("lastPage",(int)Math.ceil(count/(double)perpage));

        List<Product> productList = productService.getProducts(perpage,1);
        map.put("latestProduct",productList);

        return "welcome";
    }

    @RequestMapping(value = "/page/{pageNum}", method = RequestMethod.GET)
    public String welcome(ModelMap map, @PathVariable int pageNum) {
        int count = productService.getCount();
        int perpage = 10;
        map.put("total",count);
        map.put("page",pageNum);
        map.put("perpage",perpage);
        map.put("lastPage",(int)Math.ceil(count/(double)perpage));

        List<Product> productList = productService.getProducts(perpage,pageNum);
        map.put("latestProduct",productList);
        return "welcome";
    }
}
