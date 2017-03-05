package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.Category;
import edu.zju.cst.util.ResultSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Liang on 2/25/17.
 */

@Controller
@RequestMapping("/category")
public class CategoryController extends BaseController{

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String categoryList(ModelMap map,@RequestParam(value = "page", required=false) Integer page, @RequestParam(value = "perpage", required=false) Integer perpage) {

        if(perpage == null){
            perpage = 10;
        }
        if(page == null){
            page = 1;
        }

        int count = categoryService.getCount();
        map.put("total",count);
        map.put("page",page);
        map.put("perpage",perpage);

        map.put("lastPage",(int)Math.ceil(count/(double)perpage));


        List<Category> categoryList = categoryService.getCategories(perpage,page);

        map.put("items",categoryList);
        return "category/edit";
    }

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public String get(ModelMap map,@RequestParam(value = "category_id") int category_id) {

        Category category = categoryService.get(category_id+"");
        return JSON.toJSONString(category);
    }


    @RequestMapping(value = "/del", method = RequestMethod.GET )
    @ResponseBody
    public String delCategory(ModelMap map, @RequestParam(value = "category_id") int category_id) {

        int re = categoryService.del(category_id+"");

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
    public String addCategory(@RequestBody Category category) {
        int re  = categoryService.add(category);

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
    public String update(@RequestBody Category category) {
        int re = categoryService.update(category);

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
