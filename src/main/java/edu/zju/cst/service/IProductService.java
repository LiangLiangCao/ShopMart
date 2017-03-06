package edu.zju.cst.service;

import edu.zju.cst.bean.Product;
import edu.zju.cst.bean.User;

import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
public interface IProductService {

    int add(Product product);

    int update(Product product);

    int del(String id);

    Product get(String id);

    List<Product> getProducts(int size, int page);

    int getCount();
}
