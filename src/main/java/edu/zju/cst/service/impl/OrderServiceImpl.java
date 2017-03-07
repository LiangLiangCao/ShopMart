/*
 * LiangCao
 *
 *  Copyright (C) 2016 , Ltd. All rights reserved.
 *
 *  引用请标注来源
 */

package edu.zju.cst.service.impl;

import edu.zju.cst.bean.Orderitem;
import edu.zju.cst.bean.Orders;
import edu.zju.cst.bean.Product;
import edu.zju.cst.bean.User;
import edu.zju.cst.constant.SystemConstants;
import edu.zju.cst.dao.OrderitemMapper;
import edu.zju.cst.dao.OrdersMapper;
import edu.zju.cst.dao.ProductMapper;
import edu.zju.cst.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
@Service
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private OrdersMapper orderMapper;

    @Autowired
    private OrderitemMapper orderitemMapper;

    public int add(Orders order) {
        int re = orderMapper.insert(order);
        return re;
    }

    public int update(Orders order) {
        int re = orderMapper.updateByPrimaryKey(order);
        return re;
    }

    public int del(String id) {
        int re = orderMapper.deleteByUpdate(Long.parseLong(id));
        return re;
    }

    public Orders get(String id) {
        return orderMapper.selectByPrimaryKey(Long.parseLong(id));
    }

    public List<Orders> getOrders(int size, int page) {
        int offset = (page - 1) * size;
        return orderMapper.selectByPageSize(size, offset);
    }

    public int getCount() {
        return orderMapper.countTotal();
    }

    @Transactional(readOnly = false, rollbackFor = DataAccessException.class)
    public int addOrder(Product product) {
        Orders order = new Orders();
        add(order);
        int orderId = order.getOrdrId().intValue();

        Orderitem orderitem = new Orderitem();
        orderitem.setTotalPrice(product.getPrice());
        orderitem.setOrderId((long) orderId);
        orderitem.setProductId(product.getProductId());
        orderitem.setNum(1);

        orderitemMapper.insert(orderitem);
        return orderId;
    }

    @Transactional(readOnly = false, rollbackFor = DataAccessException.class)
    public Orderitem addOrder(Product product, Orders orders) {
        orders.setCreateTime(new Date());
        orders.setPayTime(new Date());
        orders.setIsDelete(SystemConstants.IS_DELETE_EXIST);
        orderMapper.insert(orders);

        Orderitem orderitem = new Orderitem();
        orderitem.setTotalPrice(product.getPrice());
        orderitem.setProductId(product.getProductId());
        orderitem.setOrderId(orders.getOrdrId());
        orderitem.setIsDelete(SystemConstants.IS_DELETE_EXIST);
        orderitem.setNum(1);

        orderitemMapper.insert(orderitem);
        return orderitem;
    }

    public List<Orders> getOrdersByUser(long uid) {
        return orderMapper.selectByUser(uid);
    }

    public List<Orderitem> getItermsByOrder(long uid) {
        return orderitemMapper.selectByOrder(uid);
    }

    public List<HashMap<String, Object>> getOrdersByUser(HttpServletRequest request) {
        List<HashMap<String, Object>> arryList = new ArrayList<HashMap<String, Object>>();
        User user = (User) request.getSession().getAttribute(SystemConstants.SESSION_CUSTOM);
        if (user != null) {
            List<Orders> orders = orderMapper.selectByUser(user.getUserId());
            for (Orders order : orders) {
                List<Orderitem> orderIterm = orderitemMapper.selectByOrder(order.getOrdrId());
                for (Orderitem iterm : orderIterm) {
                    Product product = productMapper.selectByPrimaryKey(iterm.getProductId());
                    HashMap<String, Object> hashMap = new HashMap<String, Object>();
                    hashMap.put("orders", order);
                    hashMap.put("orderitem", orderIterm);
                    hashMap.put("product", product);
                    arryList.add(hashMap);
                }
            }
        }
        return arryList;
    }
}
