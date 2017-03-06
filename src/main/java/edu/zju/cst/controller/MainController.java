package edu.zju.cst.controller;

import edu.zju.cst.bean.Product;
import edu.zju.cst.constant.SystemConstants;
import org.springframework.stereotype.Controller;
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
        int perpage = SystemConstants.PER_PAGE;
        int page=SystemConstants.FIRST_PAGE;
        map.put("total",count);
        map.put("page",page);
        map.put("perpage",perpage);
        map.put("lastPage",(int)Math.ceil(count/(double)perpage));

        List<Product> productList = productService.getProducts(perpage,page);
        map.put("latestProduct",productList);

        return "/ftl/welcome";
    }

    @RequestMapping(value = "/page/{pageNum}", method = RequestMethod.GET)
    public String welcome(ModelMap map, @PathVariable int pageNum) {
        int count = productService.getCount();
        int perpage = SystemConstants.PER_PAGE;
        map.put("total",count);
        map.put("page",pageNum);
        map.put("perpage",perpage);
        map.put("lastPage",(int)Math.ceil(count/(double)perpage));

        List<Product> productList = productService.getProducts(perpage,pageNum);
        map.put("latestProduct",productList);
        return "/ftl/welcome";
    }
}
