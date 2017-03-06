package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.Product;
import edu.zju.cst.constant.SystemConstants;
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
            perpage = SystemConstants.PER_PAGE;
        }
        if(page == null){
            page = SystemConstants.FIRST_PAGE;
        }
        int count = productService.getCount();
        map.put("total",count);
        map.put("page",page);
        map.put("perpage",perpage);
        map.put("lastPage",(int)Math.ceil(count/(double)perpage));

        List<Product> productList = productService.getProducts(perpage,page);
        map.put("items",productList);
        return "product/edit";
    }

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public String get(ModelMap map,@RequestParam(value = "product_id") int productId) {
        Product product = productService.get(productId+"");
        return JSON.toJSONString(product);
    }

    @RequestMapping(value = "/del", method = RequestMethod.GET )
    @ResponseBody
    public String delProduct(ModelMap map, @RequestParam(value = "product_id") int productId) {
        int re = productService.del(productId+"");

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
