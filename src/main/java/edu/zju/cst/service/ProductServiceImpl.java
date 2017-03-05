package edu.zju.cst.service;

import edu.zju.cst.bean.Product;
import edu.zju.cst.dao.ProductMapper;
import edu.zju.cst.dao.SupplierMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
@Service
public class ProductServiceImpl implements IProductService{

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

    public int getCount(){
        return productMapper.countTotal();
    }
}
