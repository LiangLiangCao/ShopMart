package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
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
public class ProductController extends BaseController{

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String productList(ModelMap map) {

        List<Product> productList = productService.getProducts(10,1);

        map.put("latestProduct",productList);
        return "product/edit";
    }

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public String get(ModelMap map,@RequestParam(value = "product_id") int product_id) {

        Product product = productService.get(product_id+"");
        return JSON.toJSONString(product);
    }


    @RequestMapping(value = "/del", method = RequestMethod.GET )
    @ResponseBody
    public String delProduct(ModelMap map, @RequestParam(value = "product_id") int product_id) {

        int re = productService.del(product_id+"");
        return re + " the result" ;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String addProduct(@RequestBody Product product) {
        int re  = productService.add(product);
        if(re>0){
            return 1+"";
        }else {
            return 0+"";
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(@RequestBody Product product) {

        int re = productService.update(product);
        return "{}";
    }


}
