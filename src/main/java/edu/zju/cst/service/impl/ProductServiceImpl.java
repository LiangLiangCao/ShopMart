/*
 * LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.service.impl;

import edu.zju.cst.bean.Product;
import edu.zju.cst.dao.ProductMapper;
import edu.zju.cst.dao.SupplierMapper;
import edu.zju.cst.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private ProductMapper productMapper;

    public int add(Product product) {
        int re  = productMapper.insert(product);
        return  re;
    }

    public int update(Product product) {
        int re = productMapper.updateByPrimaryKey(product);
        return re;
    }

    public int del(String id) {
        int re = productMapper.deleteByUpdate(Long.parseLong(id));
        return re;
    }

    public Product get(String id) {
        return productMapper.selectByPrimaryKey(Long.parseLong(id));

    }

    public List<Product> getProducts(int size, int page) {

        int offset = (page-1) * size;
        return productMapper.selectByPageSize(size,offset);
    }

    public int getCount(Integer catId){
        return productMapper.countTotal(catId);
    }

    public List<Product> getProducts(int size, int page,int catId) {

        int offset = (page-1) * size;
        return productMapper.selectByCategory(size,offset,catId);
    }
}
