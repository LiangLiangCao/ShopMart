package edu.zju.cst.service;

import edu.zju.cst.bean.Category;
import edu.zju.cst.bean.Orders;
import edu.zju.cst.bean.Product;

import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
public interface ICategoryService {

    int add(Category category);

    int update(Category category);

    int del(String id);

    Category get(String id);

    List<Category> getCategories(int size, int page);

    int getCount();
}
