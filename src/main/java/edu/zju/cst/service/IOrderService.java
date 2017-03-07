package edu.zju.cst.service;

import edu.zju.cst.bean.Orderitem;
import edu.zju.cst.bean.Orders;
import edu.zju.cst.bean.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
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

    int getCount();

    Orderitem addOrder(Product product, Orders orders);

    int addOrder(Product product);

    List<Orders> getOrdersByUser(long uid);

    List<Orderitem> getItermsByOrder(long uid);

    List<HashMap<String, Object>> getOrdersByUser(HttpServletRequest request,Integer type, String keyword);


}
