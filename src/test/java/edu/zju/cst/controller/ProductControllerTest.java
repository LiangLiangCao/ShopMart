/*
 * LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.controller;

import com.alibaba.fastjson.JSON;
import edu.zju.cst.bean.Product;
import edu.zju.cst.bean.User;
import edu.zju.cst.service.impl.ProductServiceImpl;
import edu.zju.cst.util.ResultSupport;
import org.junit.Assert;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;

/**
 * ProductController Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>Mar 9, 2017</pre>
 */
public class ProductControllerTest {
    @InjectMocks
    private ProductController productController;

    @Mock
    private ProductServiceImpl  productService;

    @Mock
    private HttpServletRequest request;

    private ResultSupport result;

    @Before
    public void before() throws Exception {
        productController = new ProductController();
        MockitoAnnotations.initMocks(this);
        result = new ResultSupport();
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: productList(ModelMap map, @RequestParam(value = "page", required=false) Integer page, @RequestParam(value = "perpage", required=false) Integer perpage, @RequestParam(value = "catId", required=false) Integer catId)
     */
    @Test
    public void testProductList() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: get(ModelMap map, @RequestParam(value = "product_id") int productId)
     */
    @Test
    public void testGet() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: delProduct(ModelMap map, @RequestParam(value = "product_id") int productId)
     */
    @Test
    public void testDelProduct() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: addProduct(@RequestBody Product product)
     */
    @Test
    public void testAddProduct() throws Exception {

        Product product = new Product();
        product.setCategoryId(new Long(1));
        product.setPrice(new BigDecimal(100));
        product.setProductName("test");

        String re = productController.addProduct(product);
        result = JSON.parseObject(re, ResultSupport.class);

        Assert.assertEquals(0, result.getCode());
    }

    /**
     * Method: update(@RequestBody Product product)
     */
    @Test
    public void testUpdate() throws Exception {
//TODO: Test goes here... 
    }


} 
