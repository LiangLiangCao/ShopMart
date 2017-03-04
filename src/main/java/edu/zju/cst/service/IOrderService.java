package edu.zju.cst.service;

import edu.zju.cst.bean.Orders;
import edu.zju.cst.bean.Product;

import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
public interface IOrderService {

    public int add(Orders order);
    public int update(Orders order);

    public int del(String id);
    public Orders get(String id);

    public List<Orders> getOrders(int size, int page);

    public int addOrder(Product product);

}
