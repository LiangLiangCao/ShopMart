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
import edu.zju.cst.dao.OrderitemMapper;
import edu.zju.cst.dao.OrdersMapper;
import edu.zju.cst.dao.ProductMapper;
import edu.zju.cst.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
@Service
public class OrderServiceImpl implements IOrderService {
//    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

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

    public int addOrder(Product product) {
        Orders order = new Orders();
        add(order);
        int orderId = order.getOrdrId().intValue();

        Orderitem orderitem = new Orderitem();
        orderitem.setTotalPrice(product.getPrice().longValue());
        orderitem.setOrderId((long) orderId);
        orderitem.setProductId(product.getProductId());
        orderitem.setNum(1);

        orderitemMapper.insert(orderitem);
        return orderId;
    }

    public Orderitem addOrder(Product product, Orders orders) {
        orders.setCreateTime(new Date());
        orders.setPayTime(new Date());
        orderMapper.insert(orders);

        Orderitem orderitem = new Orderitem();
        orderitem.setTotalPrice(product.getPrice().longValue());
        orderitem.setProductId(product.getProductId());
        orderitem.setOrderId(orders.getOrdrId());
        orderitem.setNum(1);

        orderitemMapper.insert(orderitem);
        return orderitem;
    }

}