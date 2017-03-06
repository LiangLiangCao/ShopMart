package edu.zju.cst.controller;

import edu.zju.cst.bean.Category;
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
    public String welcome(ModelMap map,
                          @RequestParam(value = "page", required=false) Integer page,
                          @RequestParam(value = "perpage", required=false) Integer perpage,
                          @RequestParam(value = "catId", required=false) Integer catId) {

        List<Category> categories = categoryService.getCategories(3,1);
        map.put("catogeries",categories);

        int total = productService.getCount(catId);
        if(page == null) page=SystemConstants.FIRST_PAGE;
        if(perpage == null) perpage = SystemConstants.PER_PAGE;

        map.put("total",total);
        map.put("page",page);
        map.put("perpage",perpage);
        map.put("lastPage",(int)Math.ceil(total/(double)perpage));

        map.put("catId",catId);

        if(catId==null){
            List<Product> productList = productService.getProducts(perpage,page);
            map.put("items",productList);
        }else{
            List<Product> productList = productService.getProducts(perpage,page,catId);
            map.put("items",productList);
        }

        return "/ftl/welcome";
    }

}
