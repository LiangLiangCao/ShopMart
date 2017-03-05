package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.Product;
import edu.zju.cst.util.ResultSupport;
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
    public String productList(ModelMap map,@RequestParam(value = "page", required=false) Integer page, @RequestParam(value = "perpage", required=false) Integer perpage) {


        if(perpage == null){
            perpage = 2;
        }
        if(page == null){
            page = 1;
        }

        List<Product> productList = productService.getProducts(perpage,page);

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

        ResultSupport result = new ResultSupport();
        if(re>0){
            result.setCode(1);
        }else {
            result.setCode(0);
            result.setMsg("删除错误");
        }
        return JSON.toJSONString(result);

    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String addProduct(@RequestBody Product product) {
        int re  = productService.add(product);

        ResultSupport result = new ResultSupport();
        if(re>0){
            result.setCode(1);
        }else {
            result.setCode(0);
            result.setMsg("添加错误");
        }
        return JSON.toJSONString(result);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(@RequestBody Product product) {
        int re = productService.update(product);

        ResultSupport result = new ResultSupport();
        if(re>0){
            result.setCode(1);
        }else {
            result.setCode(0);
            result.setMsg("更新错误");
        }
        return JSON.toJSONString(result);

    }


}
