package edu.zju.cst.service;

import edu.zju.cst.bean.Orders;
import edu.zju.cst.bean.Product;

import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
public interface IOrderService {

    int add(Orders order);

    int update(Orders order);

    int del(String id);

    Orders get(String id);

    List<Orders> getOrders(int size, int page);

    int addOrder(Product product);

}
