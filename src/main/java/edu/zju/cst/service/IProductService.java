package edu.zju.cst.service;

import edu.zju.cst.bean.Product;
import edu.zju.cst.bean.User;

import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
public interface IProductService {

    public int add(Product product);
    public int update(Product product);

    public int del(String id);

    public Product get(String id);

    public List<Product> getProducts(int size, int page);

}
