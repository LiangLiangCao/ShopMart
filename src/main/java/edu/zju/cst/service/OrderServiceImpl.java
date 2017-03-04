package edu.zju.cst.service;

import edu.zju.cst.bean.Orderitem;
import edu.zju.cst.bean.Orders;
import edu.zju.cst.bean.Product;
import edu.zju.cst.dao.OrderitemMapper;
import edu.zju.cst.dao.OrdersMapper;
import edu.zju.cst.dao.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Liang on 2/25/2017.
 */
@Service
public class OrderServiceImpl implements IOrderService{

    @Autowired
    private OrdersMapper orderMapper;

    @Autowired
    private OrderitemMapper orderitemMapper;

    public int add(Orders order) {
        int re  = orderMapper.insert(order);
        return  re;
    }

    public int update(Orders order) {
        int re = orderMapper.updateByPrimaryKey(order);
        return re;
    }

    public int del(String id) {
        int re = orderMapper.deleteByPrimaryKey(Long.parseLong(id));
        return re;
    }

    public Orders get(String id) {
        return orderMapper.selectByPrimaryKey(Long.parseLong(id));

    }

    public List<Orders> getOrders(int size, int page) {

        int offset = (page-1) * size;
        return orderMapper.selectByPageSize(size,offset);
    }


    public int addOrder(Product product){

        Orders order = new Orders();

        int orderId = add(order);
//        Promotion promotion =
        Orderitem orderitem = new Orderitem();
        orderitem.setCount(new BigDecimal(1));
        orderitem.setPrice(product.getPrice().longValue());
        orderitem.setOrderId((long) orderId);
        orderitem.setProId(product.getProId());

        int orderItemId = orderitemMapper.insert(orderitem);


        System.out.println("Order id is "+ orderId);
        System.out.println("orderItemId id is "+ orderItemId);

        return orderId;


    }
}
