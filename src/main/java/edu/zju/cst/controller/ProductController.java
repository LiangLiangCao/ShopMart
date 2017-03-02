package edu.zju.cst.controller;

import edu.zju.cst.bean.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Liang on 2/25/17.
 */

@Controller
@RequestMapping("/product")
public class ProductController extends BaseController {




    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String productList(ModelMap map) {
        List<Product> productList = productService.getProducts(10,1);

        map.put("latestProduct",productList);
        return "product/edit";
    }

    @RequestMapping(value = "/del", method = RequestMethod.GET )
    @ResponseBody
    public String delProduct(ModelMap map, @RequestParam(value = "product_id") int product_id) {

        int re = productService.del(product_id+"");
        return re + " the resut" ;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String addProduct(@RequestBody Product product) {
        productService.add(product);
        return "";
    }

    @RequestMapping(value = "/add.htm", method = RequestMethod.GET)
    public String add(ModelMap map) {

        return "product/add";
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(@RequestBody Product product) {
        productService.update(product);
        return "";
    }


}
