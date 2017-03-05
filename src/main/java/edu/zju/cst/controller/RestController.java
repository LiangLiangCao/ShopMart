package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.Product;
import edu.zju.cst.constant.SystemConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Han on 3/4/17.
 */


@Controller
public class RestController extends BaseController{

    @RequestMapping(value="/product/{id}",method= RequestMethod.GET)
    public String product(@PathVariable Long id, ModelMap map) {

        Product product = productService.get(id+"");

        if(product != null){
            map.put("product",product);
            map.put("product_var", JSON.toJSONString(product));
        }
        return "/product/detail";
    }


}
