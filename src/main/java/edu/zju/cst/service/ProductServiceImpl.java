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

    public void add(Product product) {
        productMapper.insert(product);
    }

    public void update(Product product) {
        productMapper.updateByPrimaryKey(product);
    }

    public void del(String id) {
        productMapper.deleteByPrimaryKey(Long.parseLong(id));
    }

    public void get(String id) {
        productMapper.selectByPrimaryKey(Long.parseLong(id));

    }

    public List<Product> getProducts(int size, int page) {

        int offset = (page-1) * size;
        return productMapper.selectByPageSize(size,offset);
    }
}
